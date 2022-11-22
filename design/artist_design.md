# Artist Model and Repository Classes Design Recipe

## 1. Design and create the Table

Skipping this step as the tables have already been created for this exercise.

## 2. Create Test SQL seeds

```sql
TRUNCATE TABLE artists RESTART IDENTITY;

INSERT INTO artists
(name, genre)
VALUES('Drake', 'rap');

INSERT INTO artists
(name, genre)
VALUES('Ed Sheeran', 'pop');
```

## 3. Define the class names

```ruby
class Artist

end 

class ArtistRepository

end
```

## 4. Implement the Model class

```ruby
class Artist
  attr_accessor :id, :name, :genre
end
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

```ruby
class ArtistRepository

  def all 
    # Execures the SQL query:
    # SELECT id, name, genre FROM artists;
    # returns an array of artist objects
  end

  # select a single record
  # given id in arg (int)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists WHERE id = $1;
    # returns a single artist
  end

  # inserts a new artist record
  # takes an Artist object as an argument
  def create(artist)
    # Executes the SQL query:
    # INSERT INTO artists (name, genre) VALUES($1, $2);

    # doesnt need to return anything
  end

  # deletes an artist record
  # given its id
  def delete(id)
    # Executes the SQL query:
    # DELETE FROM artists WHERE id = $1;

    # returns nothing
  end

  # updates an artist record
  # takes an Artist object
  def update(artist)
    # Executes the SQL query:
    # UPDATE artists SET name = $1, genre = $2 WHERE ID = $3;

    # returns nothing
  end
  
end
```

## 6. Write Test Examples

```ruby
# 1
# Get all artists

repo = ArtistRepository.new 
artists = repo.all

artists.length # => 2
artists.first.name # => 'Drake'
artists.first.genre # => 'rap'

# 2
# Get a single artist

repo = ArtistRepository.new
artist = repo.find(1)
artist.name # => 'Drake'
artist.genre # => 'rap'

# 3
# Get another single artist

repo = ArtistRepository.new
artist = repo.find(2)
artist.name # => 'Ed Sheeran'
artist.genre # => 'pop'

# 4
# creates a new artist

repo = ArtistRepository.new 

artist = Artist.new
artist.name = 'Beatles'
artist.genre = 'Pop'

repo.create(artist)

artists = repo.all

artists.last.name # => 'Beatles'

# 5
# deletes an artist record from their id

repo = ArtistRepository.new

artist = repo.find(1)

repo.delete(artist.id)

all_artists = repo.all

all_artists.first.id # => 2

# 6
# updates an artist record

repo = ArtistRepository.new 

artist = repo.find(1)

artist.name = 'New name'
artist.genere = 'New genre'

repo.update(artist)

updated_artist = repo.find(1)
updated_artist.name # => 'New name'
updated_artist.genre # => 'New genre'

```

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_artists_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do 
    reset_artists_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
