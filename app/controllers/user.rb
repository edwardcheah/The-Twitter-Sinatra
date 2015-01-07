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
