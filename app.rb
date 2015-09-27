require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
also_reload('lib/**/*.rb')

get('/') do
  @header = "Your Artists"
  @artists = 
  erb(:index)
end

post('/success') do
  @header = "Success!"
  erb(:success)
end