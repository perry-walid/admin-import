class RoomingList < ApplicationRecord
  belongs_to :event_user
  enum room_type: {single: 'single', double: 'double'}
end
