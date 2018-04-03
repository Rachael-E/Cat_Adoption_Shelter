require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cat.rb')
require_relative('../models/owner.rb')

get '/owners' do
  @owners = Owner.all
  erb( :"owners/index" )
end
