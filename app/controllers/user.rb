get '/user/:id' do |id|
  if !logged_in?
    set_error("Login to see a user's page.")
    redirect '/login'
  end
  @user = User.find(id)
  @three = User.find(3)
  erb :'user/profile'
end

put '/user/:id' do |id|
  @user = User.find(id)
  @user.update(params[:user])
  redirect "/user/#{current_user.id}"
end

get '/user/:id/follows' do |id|
end

get '/user/:id/followers' do |id|
end

post '/user/:id/follow' do |id|
  Following.create(from_user_id: "#{current_user.id}", to_user_id: id)
end
