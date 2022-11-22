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

end