require 'faker'

# Create new users
puts "Creating new users..."
15.times do |i|
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password123',
  )

  # If you're not using Devise, you might need to handle password hashing manually
  # user.password = BCrypt::Password.create('password123')

  user.save!

  puts "Created user #{i+1}: #{user.email}"
end

User.create(name: 'Ted Martin', email: 'test@email.com', password: 'password')

# Create new forums
puts "Creating new forums..."
10.times do
  Forum.create!(
    name: Faker::Book.unique.genre,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
    user_id: User.pluck(:id).sample
  )
end

# Create new topics
puts "Creating new topics..."
50.times do
  Topic.create!(
    name: Faker::Book.genre,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
    is_locked: false,
    is_sticky: false,
    forum_id: Forum.pluck(:id).sample,
    user_id: User.pluck(:id).sample
  )
end

# Create new posts
puts "Creating new posts..."
50.times do
  Post.create!(
    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
    topic_id: Topic.pluck(:id).sample,
    user_id: User.pluck(:id).sample
  )
end
