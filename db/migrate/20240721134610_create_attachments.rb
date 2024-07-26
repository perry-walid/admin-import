class CreateAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :attachments do |t|
      t.string :type
      t.references :event_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
