class RemoveTypeFromAttachment < ActiveRecord::Migration[7.1]
  def change
    remove_column :attachments, :type, :text
  end
end
