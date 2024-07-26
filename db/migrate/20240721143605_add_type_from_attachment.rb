class AddTypeFromAttachment < ActiveRecord::Migration[7.1]
  def change
    add_column :attachments, :description, :text
  end
end
