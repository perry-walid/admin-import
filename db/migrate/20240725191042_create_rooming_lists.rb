class CreateRoomingLists < ActiveRecord::Migration[7.1]
  def change
    create_table :rooming_lists do |t|
      t.belongs_to :event_user, null: false, foreign_key: true
      t.jsonb :guest_list
      t.datetime :check_in
      t.datetime :check_out
      t.string :room_type

      t.timestamps
    end
  end
end
