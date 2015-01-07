('A'..'Z').to_a.each { |letter| User.create(user_name: "#{letter}", password: "#{letter}") }
User.all.each { |user| user.tweets << Tweet.create(content: "a tweet by #{user.user_name}") }