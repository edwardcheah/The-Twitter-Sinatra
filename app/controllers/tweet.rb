get '/tweets' do
  @tweets = Tweet.all
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

get '/tweets/:id/edit' do |id|
  # return an HTML form for editing a tweet
  # @tweet = Tweet.find id
  # erb :'tweets/edit'
end

put '/tweets/:id' do |id|
  # update a specific tweet
  # @tweet = Tweet.find id
  # @tweet.update(params[:tweet])
  redirect 'entries/#{@tweet.id}'
end

delete '/tweets/:id' do |id|
  # delete a specific tweet
  # @tweet = Tweet.find id
  # @tweet.destroy
  # redirect '/tweets'
end
