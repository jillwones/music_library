require 'artist_repository'

def reset_artists_table
  seed_sql = File.read('spec/artist_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end
  
describe ArtistRepository do
  before(:each) do 
    reset_artists_table
  end

  it 'returns 2 artists when 2 arists in the database' do 
    repo = ArtistRepository.new 
    artists = repo.all

    expect(artists.length).to eq(2) 
    expect(artists.first.name).to eq('Drake') 
    expect(artists.first.genre).to eq('rap') 
  end

  it 'returns Drake as a single artist' do 
    repo = ArtistRepository.new
    artist = repo.find(1)
    expect(artist.name).to eq('Drake') 
    expect(artist.genre).to eq('rap') 
  end

  it 'returns Ed Sheeran as a single artist' do 
    repo = ArtistRepository.new
    artist = repo.find(2)
    expect(artist.name).to eq('Ed Sheeran') 
    expect(artist.genre).to eq('pop') 
  end

  it 'creates a new artist record' do
    repo = ArtistRepository.new 

    new_artist = Artist.new
    new_artist.name = 'Beatles'
    new_artist.genre = 'Pop'

    repo.create(new_artist)

    artists = repo.all

    expect(artists.last.name).to eq('Beatles')
  end

  it 'deletes an artist based off id' do 
    repo = ArtistRepository.new

    artist = repo.find(1)

    repo.delete(artist.id)

    all_artists = repo.all

    expect(all_artists.first.id).to eq('2')
  end

  it 'deletes 2 artists' do 
    repo = ArtistRepository.new

    artist = repo.find(1)
    artist_2 = repo.find(2)

    repo.delete(artist.id)
    repo.delete(artist_2.id)

    all_artists = repo.all

    expect(all_artists.length).to eq(0)
  end

  it 'updates an artist record with new values' do 
    repo = ArtistRepository.new 

    artist = repo.find(1)

    artist.name = 'New name'
    artist.genre = 'New genre'

    repo.update(artist)

    updated_artist = repo.find(1)
    expect(updated_artist.name).to eq('New name') 
    expect(updated_artist.genre).to eq('New genre')
  end
end