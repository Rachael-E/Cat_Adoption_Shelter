require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cat.rb')
require_relative('../models/owner.rb')

get '/cats' do
  @cats = Cat.all
  erb( :"cats/index" )
end

get '/cats/new' do
  @owners = Owner.all
  erb(:"cats/new")
end

post '/cats' do
  Cat.new(params).save
  redirect to '/cats'
end

get '/cats/:id' do
  @cat = Cat.find(params['id'])
  erb(:"cats/show")
end






get '/cats/:id/edit' do
  @owners = Owner.all
  @cat = Cat.find(params['id'])
  erb(:"cats/edit")
end

post '/cats/:id' do
  cat = Cat.new(params)
  cat.update
  redirect to "/cats/#{params['id']}"
end
