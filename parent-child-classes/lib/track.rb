class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
    if (@title.include?(keyword)) || (@artist.include?(keyword))
      return true
    end
  end
end