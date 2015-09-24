require('album')

class Artist
  def initialize(name)
    @name = name
    @albums = []
  end
  
  def add_album(album)
    @albums.push(album)
    @albums.sort do |a,b|
      a = a.name()[0].upcase()
      b = b.name()[0].upcase()
      return 1 if a > b
      return 0 if a == b
      return -1 if a < b
    end
  end
  
  def albums()
    @albums
  end
end