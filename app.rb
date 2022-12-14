# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# tasks from exercise in test driving find method section:

album_repository = AlbumRepository.new
artist_repository = ArtistRepository.new

album_repository.all.each do |record|
  p record # outputs all records currently in albums table
end

artist_repository.all.each do |record|
  p record # outputs all records currently in artists table
end

artist = artist_repository.find(4)
puts artist.name # outputs => Nina Simone

album = album_repository.find(3)
puts album.id # => 3
puts album.title # outputs => Waterloo
puts album.release_year # outputs => 1974
puts album.artist_id # outputs => 2