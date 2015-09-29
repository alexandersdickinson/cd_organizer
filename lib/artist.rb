class Artist
  @@artists = []
  
  def initialize(name)
    @name = name
    @albums = []
    @id = @@artists.length() + 1
  end
  
  def add_album(album)
    @albums.push(album)
    Artist.alpha_sort(@albums)
  end
  
  def id()
    @id
  end
  
  def name()
    @name
  end
  
  def albums()
    @albums
  end
  
  def self.all()
    @@artists
  end
  
  def self.delete()
    @@artists = []
  end
  
  def self.find(id)
    @@artists.each do |artist|
      return artist if artist.id() == id
    end
  end
  
  def save()
    @@artists.push(self)
    Artist.alpha_sort(@@artists)
  end
  
  def self.alpha_sort(collection)
    collection.sort! do |a,b|
      name1 = a.name().split('')
      name2 = b.name().split('')
      char1 = ''
      char2 = ''
      name1.each_index() do |i|
        break if i >= name2.length()
        char1 = name1[i].upcase()
        char2 = name2[i].upcase()
        if char1 == char2
          next
        else
          break
        end
      end
      if char1 > char2
        1
      elsif a == b
        0
      else
        -1
      end
    end
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
    
    def track_list()
      @track_list
    end
  end
end