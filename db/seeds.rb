# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Clear existing data
Attachment.destroy_all
EventUser.destroy_all
User.destroy_all
Event.destroy_all

# Create Users
10.times do
  User.create!(
    username: Faker::Internet.unique.username,
    password: Faker::Internet.password(min_length: 8),
    role: :user
  )
end

# Create Events
5.times do
  Event.create!(
    name: Faker::Lorem.words(number: 3).join(' '),
    description: Faker::Lorem.paragraph
  )
end

# Create EventUsers and Attachments
User.all.each do |user|
  Event.all.each do |event|
    event_user = EventUser.create!(
      user: user,
      event: event
    )

    # Attach a file to the Attachment (you can replace this with actual file paths if needed)
    attachment = Attachment.create!(
      event_user: event_user,
      description: Faker::File.extension
    )

    # Attach a file to the Attachment using Active Storage
    file_path = Rails.root.join('public', 'images', 'sample.png') # Replace with an actual file path
    attachment.file.attach(io: File.open(file_path), filename: 'sample.png', content_type: 'image/png')
  end
end

puts "Seeded #{User.count} users, #{Event.count} events, #{EventUser.count} event users, and #{Attachment.count} attachments."