require 'album_repository'

def reset_albums_table
  seed_sql = File.read('spec/album_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end
  
describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end

  it 'returns 2 albums when 2 albums in the database' do 
    repo = AlbumRepository.new 
    albums = repo.all

    expect(albums.length).to eq(2) 
    expect(albums.first.title).to eq('More Life') 
    expect(albums.first.release_year).to eq('2017') 
    expect(albums.first.artist_id).to eq('1')
  end

  it 'returns More Life as a single album' do 
    repo = AlbumRepository.new
    album = repo.find(1)
    expect(album.title).to eq('More Life') 
    expect(album.release_year).to eq('2017') 
    expect(album.artist_id).to eq('1') 
  end

  it 'returns Divide as a single album' do 
    repo = AlbumRepository.new
    album = repo.find(2)
    expect(album.title).to eq('Divide') 
    expect(album.release_year).to eq('2017') 
    expect(album.artist_id).to eq('2') 
  end
end
