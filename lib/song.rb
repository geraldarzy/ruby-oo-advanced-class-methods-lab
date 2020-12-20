class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
   s= self.new
   s.save
   s
  end

  def self.new_by_name(songname)
    s =self.new
    s.name = songname
    s
  end

  def self.create_by_name(songname)
    s = self.create
    s.name=songname
    s
  end
  
  def self.find_by_name(name)
    @@all.detect{|x|x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|x|x.name}
  end

  def self.new_from_filename(x)
    first = x.split(" - ")
    artist_name = first[0]
    song_name = first[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  

  end

  def self.create_from_filename(x)
    first = x.split(" - ")
    artist_name = first[0]
    song_name = first[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
    
  
  
  end

  def self.destroy_all
    @@all.clear
  end


    



  



end
