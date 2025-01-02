class UserResource < ApplicationResource
  attribute :id, :integer
  attribute :username, :string
  attribute :password, :string, readable: false
  attribute :role, :string

end


