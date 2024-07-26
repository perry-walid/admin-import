class Attachment < ApplicationRecord
  belongs_to :event_user

  has_one_attached :file
end
