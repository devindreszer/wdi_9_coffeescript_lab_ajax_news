num_users = 10
num_users.times do |i|
  User.create!(email: Faker::Internet.email, password: 'password')
  puts "Created User #{i}"
end

num_articles = 10
num_articles.times do |i|
  # Article will have between 1 and 10 paragraphs
  the_user = User.find(rand(1..num_users))
  article_text = Faker::Lorem.paragraphs((i%10)+1).join(' ')
  article = Article.create!(user: the_user, title: Faker::Lorem.word, url: Faker::Internet.url )

  puts "Created Article #{i}"

  # Article will have btw 1 to 7 comments.
  rand(1..3).times do |i|
    # Grab a random user that will be the commenter.
    the_user = User.find(rand(1..num_users))
    article.comments.create!(body: Faker::Lorem.paragraphs(i+1).join(' '), user: the_user)
    puts "Created comment for #{article.title} "
  end
end
