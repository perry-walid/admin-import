# app/jobs/import_excel_job.rb
class ImportExcelJob < ApplicationJob
  queue_as :default
  attr_accessor :sheet
  
  COLUMN_VARIATIONS = {
    'pid' => ['PID', 'Pid', 'pid', 'id_partner'],
    'trade_license_number' => ['trade_license_number', 'Trade License Number', 'TRADE LICENSE NUMBER', 'Trade_License_Number', 'tl_number']
  }

  def perform(sheet_id)
    @sheet = Sheet.find(sheet_id)
    @sheet.update(status: :processing)

    begin
      unless sheet.file.attached?
        raise "Sheet ##{sheet.id} does not have an attached file."
      end

      downloaded_file = sheet.file.download
      spreadsheet = Roo::Spreadsheet.open(StringIO.new(downloaded_file), extension: File.extname(sheet.file.filename.to_s))
      
      success_count = 0
      error_messages = []

      spreadsheet.sheets.each do |sheet_name|
        begin
          import_sheet(sheet_name, spreadsheet.sheet(sheet_name), sheet.file.filename.to_s)
          success_count += 1
        rescue StandardError => e
          error_message = "Sheet '#{sheet_name}' failed: #{e.message}"
          error_messages << error_message
          Rails.logger.error error_message
          next
        end
      end

      if success_count == 0
        sheet.update(
          status: :failed, 
          error_message: "No sheets were successfully imported. Errors: #{error_messages.join('; ')}"
        )
      elsif success_count < spreadsheet.sheets.length
        sheet.update(
          status: :partially_completed,
          error_message: "#{success_count} of #{spreadsheet.sheets.length} sheets imported. Errors: #{error_messages.join('; ')}"
        )
      else
        sheet.update(status: :completed)
      end

    rescue => e
      sheet.update(status: :failed, error_message: "File-level error: #{e.message}")
      Rails.logger.error "Failed to import Excel file for Sheet ##{sheet.id}: #{e.message}"
    end
  end

  private

  def import_sheet(sheet_name, sheet, workbook_name)
    headers = sheet.row(1).map(&:to_s)
    
    # Create a mapping of found columns
    column_mapping = {}
    
    # Handle PID and Trade License Number normally
    COLUMN_VARIATIONS.each do |field, variations|
      found_header = variations.find { |var| headers.include?(var) }
      column_mapping[field] = found_header if found_header
    end
    
    # Special handling for IBAN using regex
    iban_header = headers.find { |header| header.match?(/iban/i) }
    column_mapping['iban'] = iban_header if iban_header
    
    # Check if at least one required column exists
    if column_mapping.empty?
      raise "Sheet must contain at least one of these columns: PID, IBAN, or Trade License Number"
    end

    records = []
    (2..sheet.last_row).each do |i|
      row = Hash[[headers, sheet.row(i)].transpose]
      
      # Format PID as string without decimal point if it's a number
      pid_value = column_mapping['pid'] ? row[column_mapping['pid']] : nil
      pid_value = pid_value.to_f.to_i.to_s if pid_value.is_a?(Float)
      
      record_data = {
        pid: pid_value,
        iban: column_mapping['iban'] ? row[column_mapping['iban']] : nil,
        trade_license_number: column_mapping['trade_license_number'] ? row[column_mapping['trade_license_number']] : nil,
        data: row,
        sheet_name: sheet_name,
        work_book_name: workbook_name,
        sheet_id: @sheet.id
      }

      # Skip empty rows or rows with no required fields
      next if record_data.values_at(:pid, :iban, :trade_license_number).all?(&:nil?)
      
      records << Record.new(record_data)
    end
    
    if records.empty?
      raise "No valid records found in sheet"
    end
    
    Record.import(records)
  end
end