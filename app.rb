require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
also_reload('lib/**/*.rb')

get('/') do
  @header = "Your Artists"
  @artists = Artist.all()
  erb(:index)
end

post('/success') do
  @header = "Success!"
  artist = Artist.new(params.fetch('artist'))
  artist.save()
  erb(:success)
end