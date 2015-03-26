require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end

# Create unique post
if Post.where({title: "My unique post"}).count == 0
  Post.create!(
    title: "My unique post",
    body:  "Body text of my unique post"
  )
end

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

# Create unique comment
if Comment.where({body: "My unique comment"}).count == 0
  Comment.create!(
    post: posts.sample,
    body: "My unique comment"
  ) 
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments create"

