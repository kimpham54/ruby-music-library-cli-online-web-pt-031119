require_relative './module.rb'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

    def initialize(name=nil)
      @name = name
      @songs = []
      # @artists = []
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

    def self.create(word)
      genre = Genre.new(name=word)
      genre.save
      genre
    end

    def artists
    #   @songs.each do |item|
    #     if @artists.include?(item.artist) == false
    #       @artists << item.genre
    #     end
    # end
artists = []
    @songs.map do |item|
      artists << item.artist
  end
  artists.uniq

  end
end
