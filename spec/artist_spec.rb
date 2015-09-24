require('rspec')
require('artist')

describe(Artist) do
  describe('#add_album') do
    it('adds albums to an array associated with the artist') do
      prince = Artist.new("The Artist Formerly Known As Prince")
      test_album = Album.new('Purple Rain', ["Let\'s Go Crazy", "The Beautiful Ones", "I Would Die 4 U", "Purple Rain"])
      prince.add_album(test_album)
      expect(prince.albums()).to(eq([test_album]))
    end
    
    it('alphabetizes albums') do
      kraftwerk = Artist.new("Kraftwerk")
      radioaktivitaet = Album.new("Radioaktivitaet", ["Radioaktivität", "Ohm Sweet Ohm"])
      autobahn = Album.new("Autobahn", ["Autobahn", "Kometenmelodie"])
      die_mensch_maschine = Album.new("Die Mensch Maschine", ["Neonlicht", "Die Roboter", "Das Modell", "Die Mensch Maschine"])
      kraftwerk.add_album(radioaktivitaet)
      kraftwerk.add_album(autobahn)
      kraftwerk.add_album(die_mensch_maschine)
      expect(kraftwerk.albums()).to(eq([autobahn, die_mensch_maschine, radioaktivitaet]))
    end
  end
end