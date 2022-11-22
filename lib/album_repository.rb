require_relative './album'

class AlbumRepository
  def all 
    albums = []

    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      albums << record_to_album_object(record)
    end

    return albums
  end

  def find(id)

    sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]

    return record_to_album_object(record)
  end

  def create(album)

    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES($1, $2, $3);'
    sql_params = [album.title, album.release_year, album.artist_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  private 

  def record_to_album_object(record)
    album = Album.new 
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']
    return album
  end
  
end