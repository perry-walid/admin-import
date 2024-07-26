class UserResource < ApplicationResource
  attribute :id, :integer
  attribute :username, :string
  attribute :password, :string, readable: false
  attribute :role, :string

  many_to_many :events
end


