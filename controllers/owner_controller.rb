require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/cat.rb')
require_relative('../models/owner.rb')

get '/owners' do
  @owners = Owner.all
  erb( :"owners/index" )
end

get '/owners/new' do
  @cats = Cat.all
  erb(:"owners/new")
end

post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
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

post '/owners/:id/delete' do
  owner = Owner.find(params['id'])
  owner.delete
  redirect to '/owners'
end
