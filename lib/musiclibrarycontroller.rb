class MusicLibraryController
  attr_accessor :importer
  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")

    input = gets.strip.chomp
    # binding.pry
    if input == "list songs"
      self.list_songs
    elsif input == "list artists"
      self.list_artists
    elsif input == "list genres"
      self.list_genres
    elsif input == "list artist"
      self.list_songs_by_artist
    elsif input == "list genre"
      self.list_songs_by_genre
    elsif input == "play song"
      self.play_song

    else
      puts "hey"
    end
    end
  end

# https://github.com/kimpham54/ruby-music-library-cli-online-web-pt-031119/blob/solution/lib/music_library_controller.rb
  def list_songs
# binding.pry
alphabetized = self.importer.sort_by{|name| name.split(" - ")[1]}
    alphabetized.each.with_index do |item, index|
      puts("#{index + 1}. #{item.gsub(".mp3","")}")
    end
  end

def list_artists
# binding.pry
  # Artist.all.uniq.sort_by{|name| Artist.name}.each.with_index do |item, index|
  #         puts("#{index + 1}. #{item}")
  #       end

artistarray = []
Artist.all.each do |item|
          # item
          # binding.pry
artistarray << item.name
end

artistarray.uniq.sort.each.with_index do |item, index|
  puts("#{index + 1}. #{item}")
end



# artistarray = []
# alphabetized = self.importer.sort_by{|name| name.split(" - ")[0]}
#       alphabetized.each do |item|
#         artistname = item.split(" - ")[0]
#         artistarray << artistname
#         binding.pry
#       end
#
#         # if artistarray.include?(artistname) == false
#         artistarray.uniq.each.with_index do |item, index|
#         puts("#{index + 1}. #{item}")
#       end
end


def list_genres
  genresarray = []
  Genre.all.each do |item|
    genresarray << item.name
  end

  genresarray.uniq.sort.each.with_index do |item, index|
    puts("#{index + 1}. #{item}")
  end

end

  # list = []
  #     self.importer.each.with_index do |item, index|
  #       list << "#{index + 1}. #{item.gsub(".mp3","")}"
  #       # binding.pry
  #     end
  #     puts list

def list_songs_by_artist
  puts("Please enter the name of an artist:")
  input = gets.strip.chomp
  # songarray = []
  #
  # Song.all.each do |item|
  #   # binding.pry
  #   if input == item.artist.name
  #     songarray << item.name
  #
  #   end
  # end
  #
  # songarray.sort.each.with_index do |item, index|
  #   binding.pry
  #   puts("#{index +1}. #{item}")
  # end
end

def list_songs_by_genre
  puts("Please enter the name of a genre:")
  input = gets.strip.chomp


  alphabetized = self.importer.sort_by{|name| name.split(" - ")[1]}
      alphabetized.each.with_index do |item, index|
        if input == item.split(" - ")[2]
        puts("#{index + 1}. #{item.split(" - ")[0]} - #{item.split(" - ")[1]}")
      end
    end
end

def play_song
end




end
