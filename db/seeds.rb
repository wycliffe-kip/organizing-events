puts "🌱 Seeding spices..."

# Seed your database here

# Create sample users
users = [
  { name: 'Vicky', email: 'vicky@example.com', password: 'password1' },
  { name: 'Jack', email: 'jack@example.com', password: 'password2' }
]

# Create sample events
events = [
  { image_url:'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F129219001%2F197361445633%2F1%2Foriginal.20210316-120602?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=173%2C0%2C2160%2C1080&s=051b4d4b35197024ec4fe41010fe081a', title: 'Birthday Party', description: 'Join us for a fun-filled birthday celebration!', date: '2023-07-15', location: '123 Main St' },
  { image_url: 'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F529109909%2F133304681245%2F1%2Foriginal.20230605-082131?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C150%2C2400%2C1200&s=3d3fa439e6a5bf0c4f9873fd704879ff', title: 'Conference', description: 'An industry conference featuring expert speakers.', date: '2023-08-20', location: '456 Elm St' }
]

# Create sample reviews
reviews = [
  { rating: 4, comment: 'Great party! Enjoyed every moment.' },
  { rating: 5, comment: 'The best birthday party ever!' },
  { rating: 4, comment: 'Amazing conference with valuable insights.' },
  { rating: 3, comment: 'Good event, but could be better.' }
]

events.each do |event_data|
  event = Event.create(event_data)
  users.each do |user_data|
    user = User.create(user_data)
    
    review = reviews.sample.merge(user_id: user.id, event_id: event.id)
    Review.create(review)
  end
end

puts 'Seed data created successfully!'

puts "✅ Done seeding!"

