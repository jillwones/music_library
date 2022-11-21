# Album Model and Repository Classes Design Recipe

## 1. Design and create the Table

Skipping this step as the tables have already been created for this exercise.

## 2. Create Test SQL seeds

Skipping this step as the SQL seed was provided for this exercise.

## 3. Define the class names

```ruby
class Album

end 

class AlbumRepository

end
```

## 4. Implement the Model class

```ruby
class Album
  attr_accessor :id, :title, :release_year, :artist_id
end
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

```ruby
class AlbumRepository

  def all 
    # Execures the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;
    # returns an array of album objects
  end
  
end
```

## 6. Write Test Examples

```ruby
# 1
# Get all albums

repo = AlbumRepository.new 
albums = repo.all

albums.length # => 12
albums.first.title # => 'Doolittle'
albums.first.release_year # => 1989
albums.first.artist_id # => 1
```

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'albums' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
