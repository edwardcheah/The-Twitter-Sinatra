5.times { User.create(user_name: 'a', password: 'a') }
User.all.each { |user| user.tweets << Tweet.create(content: "a tweet by #{user.user_name}") }