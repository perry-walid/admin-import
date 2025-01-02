class AddIndexesToRecords < ActiveRecord::Migration[6.1]
  def change
    add_index :records, :pid
    add_index :records, :iban
    add_index :records, :trade_license_number
  end
end