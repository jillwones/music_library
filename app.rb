# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

album_repository = AlbumRepository.new

# Print out each record from the result set .
album_repository.all.each do |record|
  p record
end