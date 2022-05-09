=begin
Describe the problem:
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them

Design the class interface:
class MusicTracker
  def initialize
    
  end

  def add_track(track) task is a string
    no return value
    raises error if track is already added
  end

  def list_tracks
    returns list of tracks as strings
    raises error if no tracks are listed
  end
end
  
end

Create examples as tests:
#1 
music_tracker = MusicTracker.new
music_tracker.add_track("Very cool song")
music_tracker.list_tracks => "Very cool song"

#2
music_tracker = MusicTracker.new
music_tracker.list_tracks => raises error

#3
music_tracker = MusicTracker.new
music_tracker.add_track(500)
music_tracker.list_tracks => raises error

#4
music_tracker = MusicTracker.new
music_tracker.add_track("Very cool song")
music_tracker.add_track("Very cool song")
music_tracker.list_tracks => raises error
=end

class MusicTracker
  def initialize
    @tracks = []
  end

  def add_track(track)
    fail "Not a valid input" if !track.is_a? String
    if @tracks.include?(track)
      fail "Track already added"
    else
      @tracks << track
    end
  end

  def list_tracks
    fail "No tracks added" if @tracks.empty?
    return @tracks.join(", ")
  end
end