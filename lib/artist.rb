class Artist
  def initialize(name)
    @name = name
    @albums = []
  end
  
  def add_album(album)
    @albums.push(album)
    @albums.sort! do |a,b|
      a = a.name()[0].upcase()
      b = b.name()[0].upcase()
      if a > b
        1
      elsif a == b
        0
      else
        -1
      end
    end
  end
  
  def albums()
    @albums
  end
  
  class Album
    def initialize(name, *tracks)
      @name = name
      track_list = []
      track_list = tracks.each() {|track| track_list.push(track)} 
      @track_list = track_list
    end
  
    def name()
      @name
    end
  end
end