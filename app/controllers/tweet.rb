get '/tweets' do
  @tweets = Tweet.all.sort_by { |t| t.elapsed_time }
  erb :'tweet/index'
end

post '/tweets' do
  @tweet = Tweet.create(params[:tweet])
  if request.xhr?
    {author: @tweet.author, tweet: {id: @tweet.id, elapsed_time: @tweet.elapsed_time, content: @tweet.content}, tweet_count: @tweet.author.tweets.count}.to_json
  else
    redirect '/tweets'
  end
end

delete '/tweet/:id' do |id|
  @tweet = Tweet.find(id)
  @tweet.destroy
  redirect '/tweets'
end
