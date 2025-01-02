class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.string :pid
      t.string :iban
      t.string :trade_license_number
      t.jsonb :data

      t.timestamps
    end
  end
end
