['/user/:id', '/user/:id/follows', '/user/:id/followers', '/user/:id/follow'].each do |route|
  before route do |id|
    @user = User.find(id)
  end
end

get '/user/:id', auth: :user do |id|
  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'
  erb :'user/profile', locals: {user: @user, follow_action: @follow_action}
end

put '/user/:id' do |id|
  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'
  @user.update(params[:user])
  if request.xhr?
    full = erb :'user/profile', locals: {user: @user, follow_action: @follow_action}, layout: false
    mini = erb :'user/mini_profile', locals: {user: @user}, layout: false
    {full: full, mini: mini}.to_json
  else
    redirect "/user/#{current_user.id}"
  end
end

get '/user/:id/follows', auth: :user do |id|
  @follow_type = 'follows'
  @followings = @user.follows
  erb :'/user/followings'
end

get '/user/:id/followers', auth: :user do |id|
  @follow_type = 'followers'
  @followings = @user.followees
  erb :'/user/followings'
end

post '/user/:id/follow', auth: :user do |id|
  existing_follow = Following.where(from_user_id: "#{current_user.id}", to_user_id: id)
  existing_follow.count > 0 ? existing_follow.first.destroy : Following.create(from_user_id: "#{current_user.id}", to_user_id: id)

  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'

  if request.xhr?
    full = erb :'user/profile', locals: {user: @user, follow_action: @follow_action}, layout: false
    mini = erb :'user/mini_profile', locals: {user: current_user}, layout: false
    {full: full, mini: mini}.to_json
  else
    redirect "/user/#{id}"
  end
end
