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
  
  class Album
    def initialize(name, track_list)
      @name = name
      @track_list = track_list
    end
  
    def name()
      @name
    end
  end
end