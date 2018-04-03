require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cat.rb')
require_relative('../models/owner.rb')

get '/owners' do
  @owners = Owner.all
  erb( :"owners/index" )
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @cats = Cat.all
  @owner = Owner.find(params['id'])
  erb(:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to "/owners/#{params['id']}"
end
