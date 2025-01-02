class CreateSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :sheets do |t|
      t.string :name
      t.integer :status
      t.text :error_message

      t.timestamps
    end
  end
end
