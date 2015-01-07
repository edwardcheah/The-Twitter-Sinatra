get '/user/:id', auth: :user do |id|
  @user = User.find(id)
  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'
  erb :'user/profile', locals: {user: @user, follow_action: @follow_action}
end

put '/user/:id' do |id|
  @user = User.find(id)
  @user.update(params[:user])
  redirect "/user/#{current_user.id}"
end

get '/user/:id/follows', auth: :user do |id|
  @user = User.find(id)
  @follow_type = 'follows'
  @followings = @user.follows
  erb :'/user/followings'
end

get '/user/:id/followers', auth: :user do |id|
  @user = User.find(id)
  @follow_type = 'followers'
  @followings = @user.followees
  erb :'/user/followings'
end

post '/user/:id/follow', auth: :user do |id|
  @user = User.find(id)
  existing_follow = Following.where(from_user_id: "#{current_user.id}", to_user_id: id)
  if existing_follow.count > 0
    existing_follow.first.destroy
  else
    Following.create(from_user_id: "#{current_user.id}", to_user_id: id)
  end

  @follow_action = @user.has_followee(current_user) ? 'Unfollow' : 'Follow'

  if request.xhr?
    full = erb :'user/profile', locals: {user: @user, follow_action: @follow_action}, layout: false
    mini = erb :'user/mini_profile', locals: {user: current_user}, layout: false
    {full: full, mini: mini}.to_json
  else
    redirect "/user/#{id}"
  end
end
