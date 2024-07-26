class EventResource < ApplicationResource
  attribute :id, :integer
  attribute :name, :string
  attribute :description, :string
  attribute :scheduled_for, :datetime
  attribute :status, :string
  attribute :location, :string

  many_to_many :users
  has_many :event_users

  attribute :image_url, :string do
    @object.image.url
  end
    
end
