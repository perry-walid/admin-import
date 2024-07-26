class EventUserResource < ApplicationResource
  attribute :user_id, :integer
  attribute :event_id, :integer

  has_many :rooming_lists
end
