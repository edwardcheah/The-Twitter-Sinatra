require 'faker'
('A'..'Z').to_a.each { |letter| User.create(user_name: "#{letter}", password: "#{letter}") }
User.all.each do |user|
  user.tweets << Tweet.create(content: "a tweet by #{user.user_name}")
  user.blurb = "this is a default blurb"
  user.save
end
