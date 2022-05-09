require 'music_tracker'

RSpec.describe MusicTracker do
  context "listing added track" do
    it "returns a track as a string" do
      music_tracker = MusicTracker.new
      music_tracker.add_track("Very cool song")
      expect(music_tracker.list_tracks).to eq "Very cool song"
    end
  end

  context "lists multiple tracks" do
    it "returns a list of tracks as a string" do
      music_tracker = MusicTracker.new
      music_tracker.add_track("Very cool song")
      music_tracker.add_track("Not so cool song")
      music_tracker.add_track("Guilty pleasure song")
      expect(music_tracker.list_tracks).to eq "Very cool song, Not so cool song, Guilty pleasure song"
    end
  end

  context "when no tracks are added" do
    it "raises an error when trying to list tracks" do
      music_tracker = MusicTracker.new
      expect{music_tracker.list_tracks}.to raise_error "No tracks added"
    end
  end

  context "when adding anything but a string" do
    it "raises an error" do
      music_tracker = MusicTracker.new
      expect{music_tracker.add_track(500)}.to raise_error "Not a valid input"
    end
  end

  context "when adding a song already included" do
    it "raises an error" do
      music_tracker = MusicTracker.new
      music_tracker.add_track("Very cool song")
      expect{music_tracker.add_track("Very cool song")}.to raise_error "Track already added"
    end
  end
end