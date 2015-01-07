get '/user/:id' do |id|
  if !logged_in?
    set_error("Login to see a user's page.")
    redirect '/login'
  end
  @user = User.find(id)
  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'
  erb :'user/profile', locals: {user: @user, follow_action: @follow_action}
end

put '/user/:id' do |id|
  @user = User.find(id)
  @user.update(params[:user])
  redirect "/user/#{current_user.id}"
end

get '/user/:id/follows' do |id|
  @user = User.find(id)
  @follow_type = 'follows'
  @followings = @user.follows
  erb :'/user/followings'
end

get '/user/:id/followers' do |id|
  @user = User.find(id)
  @follow_type = 'followers'
  @followings = @user.followees
  erb :'/user/followings'
end

post '/user/:id/follow' do |id|
  @user = User.find(id)
  existing_follow = Following.where(from_user_id: "#{current_user.id}", to_user_id: id)
  if existing_follow.count > 0
    existing_follow.first.destroy
  else
    Following.create(from_user_id: "#{current_user.id}", to_user_id: id)
  end

  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'

  if request.xhr?
    erb :'user/profile', locals: {user: @user, follow_action: @follow_action}, layout: false
  else
    redirect "/user/#{id}"
  end
end
