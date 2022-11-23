# file: app.rb

require_relative './lib/album_repository'
require_relative './lib/artist_repository'
require_relative './lib/database_connection'

class Application
  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run 
    @io.puts "\nWelcome to the music library manager!"
    loop do 
      print_menu
      process(@io.gets.chomp)
    end
  end

  private 

  def print_menu
    @io.puts "\nWhat would you like to do?"
    @io.puts '1 - List all albums'
    @io.puts '2 - List all artists'
    @io.puts '9 - Exit program'
    @io.puts "\nEnter you choice:"
  end

  def process(choice)
    case choice 
    when '1' then print_all_albums
    when '2' then print_all_artists
    when '9' then exit
    else
      @io.puts "\nInvalid input"
    end
  end

  def print_all_albums
    @io.puts "\nHere is your list of albums:"
    @album_repository.all.each do |album|
      @io.puts "* #{album.id} - #{album.title}"
    end
  end

  def print_all_artists
    @io.puts "\nHere is your list of artists:"
    @artist_repository.all.each do |artist|
      @io.puts "* #{artist.id} - #{artist.name}"
    end
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end

