get '/tweets' do
  @tweets = Tweet.all.sort_by { |t| t.elapsed_time }
  erb :'tweet/index'
end

get '/tweets/new' do
  # erb :'tweets/new'
end

post '/tweets' do
  @tweet = Tweet.create(params[:tweet])
  if request.xhr?
    {author: @tweet.author.user_name, tweet: @tweet}.to_json
  else
    redirect '/tweets'
  end
end

get '/tweets/:id' do |id|
  # display a specific tweet
  # @tweet = Tweet.find id
  # erb :'tweets/single'
end

delete '/tweets/:id' do |id|
  @tweet = Tweet.find(id)
  @tweet.destroy
  redirect '/tweets'
end
