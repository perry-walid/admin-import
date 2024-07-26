class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_one :attachment
  has_many :rooming_lists
end
