get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(user_name: params[:user][:user_name])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    set_error('Invalid login.')
    redirect '/login'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  new_user = User.new(params[:user])

  if new_user.save
    session[:user_id] = new_user.id
    redirect '/'
  else
    get_ar_errors(new_user)
    redirect '/signup'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
