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
