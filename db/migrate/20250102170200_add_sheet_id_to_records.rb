class AddSheetIdToRecords < ActiveRecord::Migration[7.1]
  def change
    add_reference :records, :sheet, foreign_key: true
  end
end
