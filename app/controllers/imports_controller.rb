# app/controllers/imports_controller.rb
class ImportsController < ApplicationController
  def new
    @sheet = Sheet.new
  end

  def create
    if params[:file]
      params[:file].each do |uploaded_file|
        sheet = Sheet.create!(
          name: uploaded_file.original_filename,
          status: :pending
        )
        sheet.file.attach(uploaded_file)

        # Enqueue the background job with the sheet's ID
        ImportExcelJob.perform_later(sheet.id)
      end
      redirect_to root_path, notice: 'Files are being processed.'
    else
      redirect_to root_path, alert: 'Please upload at least one file.'
    end
  end
end