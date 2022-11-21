require_relative './album'

class AlbumRepository
  def all 
    albums = []

    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      album = Album.new 
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end

    return albums
  end
end