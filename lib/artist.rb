require 'pry'
require_relative './module.rb'


class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

    def initialize(name=nil)
      @name = name
      @songs = []
      # @genres = []
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
      artist = Artist.new(name)
      artist.save
      artist
    end

    def add_song(song)
      if song.artist == nil
        song.artist = self
      end

      if @songs.include?(song) == false
        @songs << song
      end
    end

    def genres
      # Song.all.map do |item|
      #   if item.artist == self
      #     @genres << item.genre
      #   end
      # end
      genres = []
      @songs.map do |item|
        # if @songs.include?(item.genre) == false
          genres << item.genre
      # end
    end
    genres.uniq
  end

end
