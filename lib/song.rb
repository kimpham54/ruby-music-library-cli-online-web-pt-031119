require 'pry'
require_relative './module.rb'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

    def initialize(name=nil, artist=nil, genre=nil)
      @name = name
      # @artist = artist
      # if @artist != ""
      #   artist.add_song(self)
      # end
      if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
      # @genre = genre
      # @artist = artist
      # artist.add_song(self)
      # @genre = genre
      # genre.songs << self

    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end


    def genre=(genre)
      @genre = genre
      if genre.songs.include?(self) == false
      genre.songs << self
    end
    end

    def self.all()
      @@all
    end

    def save()
      @@all << self
    end

    def self.destroy_all()
      self.all.clear
    end

    def self.create(name)
      song = Song.new(name)
      song.save
      song
    end


    def self.new_from_filename(songfile)
      songfile = songfile.split(" - ")
      song = Song.find_or_create_by_name(name=songfile[1])
      song.artist = Artist.find_or_create_by_name(name=songfile[0])
      stripped = songfile[2].gsub(".mp3","")
      song.genre = Genre.find_or_create_by_name(name=stripped)
      song
    end

    def self.create_from_filename(songfile)
      song = self.new_from_filename(songfile)
      @@all << song
      song
    end

#
#     def self.find_by_name(name)
#       @@all.find{|item| item.name == name}
#     end
#
#     def self.find_or_create_by_name(name)
#       if self.find_by_name(name) == nil
#         self.create(name)
#       else
#         self.find_by_name(name)
#     end
#   end
#
# end



  end
