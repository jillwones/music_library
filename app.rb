# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

album_repository = AlbumRepository.new
artist_repository = ArtistRepository.new

album_repository.all.each do |record|
  p record
end

artist_repository.all.each do |record|
  p record
end

artist = artist_repository.find(4)
puts artist.name