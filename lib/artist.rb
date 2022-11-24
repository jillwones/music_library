class Artist 
  attr_accessor :id, :name, :genre, :albums

  def initialize
    @albums = []
  end
end