require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
also_reload('lib/**/*.rb')

get('/') do
  @header = "Your Artists"
  @artists = Artist.all()
  erb(:index)
end

post('/art-success') do
  @header = "Success!"
  artist = Artist.new(params.fetch('artist'))
  artist.save()
  erb(:art_success)
end

post('/:id/album-success') do
  @header = "Success!"
  tracks = params.fetch('tracks')
  tracks = tracks.split(', ')
  album = Artist::Album.new(params.fetch('album'), *tracks)
  @artist = Artist.find(params.fetch('id').to_i())
  @artist.add_album(album)
  erb(:album_success)
end

get('/:id') do
  @artist = Artist.find(params.fetch('id').to_i())
  @header = @artist.name()
  erb(:artist)
end