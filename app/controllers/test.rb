get '/tests' do
  # display a list of all tests
  # @tests = Test.all
  # erb :'tests/index'
end

get '/tests/new' do
  # return an HTML form for creating a new test
  # erb :'tests/new'
end

post '/tests' do
  # create a new test
  # @test = Test.create(params[:test])
  # redirect '/tests'
end

get '/tests/:id' do |id|
  # display a specific test
  # @test = Test.find id
  # erb :'tests/single'
end

get '/tests/:id/edit' do |id|
  # return an HTML form for editing a test
  # @test = Test.find id
  # erb :'tests/edit'
end

put '/tests/:id' do |id|
  # update a specific test
  # @test = Test.find id
  # @test.update(params[:test])
  redirect 'entries/#{@test.id}'
end

delete '/tests/:id' do |id|
  # delete a specific test
  # @test = Test.find id
  # @test.destroy
  # redirect '/tests'
end
