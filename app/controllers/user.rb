get '/user/:id' do |id|
  if !logged_in?
    set_error("Login to see a user's page.")
    redirect '/login'
  end
  @user = User.find(id)
  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'
  erb :'user/profile'
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
  params[:follow] = {
    from_user_id: "#{current_user.id}",
    to_user_id: id
  }
  existing_follow = Following.find_by(params[:follow])
  if existing_follow
    existing_follow.destroy
  else
    Following.create(params[:follow])
  end
  redirect "/user/#{id}"
end
