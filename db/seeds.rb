require 'faker'
('A'..'Z').to_a.each { |letter| User.create(user_name: "#{letter}", password: "#{letter}") }
User.all.each do |user|
  user.tweets << Tweet.create(content: "a tweet by #{user.user_name}")
  user.blurb = "this is a default blurb"
  user.city = "New York"
  user.pic_url = "http://lakelandtn.gov/images/pages/N147/tree.png"
  user.follows << User.find(((User.all.count+1)*rand).floor)
  user.save
end
