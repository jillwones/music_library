require_relative './artist.rb'

class ArtistRepository
  def all
    artists = []

    sql = 'SELECT id, name, genre FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      artist = Artist.new 
      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']

      artists << artist
    end
    return artists
  end

  def find(id)

    sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    result_set.each do |record|
      artist = Artist.new 

      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']

      return artist
    end
  end

  def create(artist)

    sql = 'INSERT INTO artists (name, genre) VALUES($1, $2);'
    sql_params = [artist.name, artist.genre]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)

    sql = 'DELETE FROM artists WHERE id = $1;'
    sql_params = [id]
    
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  def update(artist)

    sql = 'UPDATE artists SET name = $1, genre = $2 WHERE ID = $3;'
    sql_params = [artist.name, artist.genre, artist.id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end
end