require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cat.rb')
require_relative('../models/owner.rb')

get '/cats' do
  @cats = Cat.all
  erb( :"cats/index" )
end
