class AddWorkBookAndSheetNamesToRecord < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :work_book_name, :string
    add_column :records, :sheet_name, :string
  end
end
