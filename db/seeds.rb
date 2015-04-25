if Rails.env.development? 
require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name, 
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10),
  )
  user.skip_confirmation!
  user.save!
end
if User.where({email: 'admin@bloccit.com'}).count == 0
  user = User.new(
    name:     'Admin User', 
    email:    'admin@bloccit.com',
    password: 'helloworld',
    role:     'admin'
  )
  user.skip_confirmation!
  user.save!
end
if User.where({email: 'moderator@bloccit.com'}).count == 0
  user = User.new(
    name:     'Moderator User', 
    email:    'moderator@bloccit.com',
    password: 'helloworld',
    role:     'moderator'
  )
  user.skip_confirmation!
  user.save!
end
if User.where({email: 'noel@bloccit.com'}).count == 0
  user = User.new(
    name:     'Noel Deguzman', 
    email:    'noel@bloccit.com',
    password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    name:        Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do 
  post = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.update_rank
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

end
