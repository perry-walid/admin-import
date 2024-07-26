class RoomingListResource < ApplicationResource
  attribute :room_type, :string
  attribute :guest_list, :hash
  attribute :check_in, :date
  attribute :check_out, :date

  belongs_to :event_user

  filter :event_user_id, :integer
end
