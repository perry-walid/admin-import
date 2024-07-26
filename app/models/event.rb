class Event < ApplicationRecord
    has_many :event_users
    has_many :users, through: :event_users
    has_one_attached :image
    enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }
end
