get '/user/:id' do |id|
  if !logged_in?
    set_error("Login to see a user's page.")
    redirect '/login'
  end
  @user = User.find(id)
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
  Following.create(from_user_id: "#{current_user.id}", to_user_id: id)
  redirect "/user/#{id}"
end
