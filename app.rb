require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/cat_controller')
require_relative('controllers/owner_controller')

get '/' do
  erb(:index)
end
