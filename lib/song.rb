require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.alphabetical
    @@all.sort_by() do |song_name|
      song_name.name
    end
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    # binding.pry
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(song)
      @@all.find do |song_name|
        song_name.name == song
      end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  # In order to prevent duplicate songs being created that actually represent
  # the same song (based on the song name),
  # we're going to build a Song.find_or_create_by_name class method.
  # This method will accept a string name for a song and either return a matching song
  # instance with that name or create a new song with the name and return the song instance.

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
  #1) Song Class Methods .create instantiates and saves the song, and it returns the new song that was created

  def self.new_from_filename(filename)
    # binding.pry
    new_song = filename.split(" - ")[1]
    new_song = new_song.split(".")[0]
    new_artist = filename.split(" - ")[0]
    song = Song.create_by_name(new_song)
    song.artist_name = new_artist
    song
  end

  def self.create_from_filename(filename)
    song_name = self.new_from_filename(filename)
    @@all << song_name
    song_name
  end

end
