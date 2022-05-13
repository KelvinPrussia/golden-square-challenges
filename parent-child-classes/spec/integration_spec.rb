require 'music_library'
require 'track'

RSpec.describe "integration" do
  context "when multiple tracks are added" do
    it "returns a list of all tracks" do
      library = MusicLibrary.new
      track_1 = Track.new("See You Again", "Tyler the Creator")
      track_2 = Track.new("Redstripe Rhapsody", "Lausse the Cat")
      track_3 = Track.new("Juggernaut", "Tyler the Creator")
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.all).to eq [track_1, track_2, track_3]
    end

    it "returns a list of tracks containing the keyword in the artist" do
      library = MusicLibrary.new
      track_1 = Track.new("See You Again", "Tyler the Creator")
      track_2 = Track.new("Redstripe Rhapsody", "Lausse the Cat")
      track_3 = Track.new("Juggernaut", "Tyler the Creator")
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.search("Tyler")).to eq [track_1, track_3]
    end

    it "returns a list of tracks containing the keyword in the track" do
      library = MusicLibrary.new
      track_1 = Track.new("See You Again", "Tyler the Creator")
      track_2 = Track.new("Redstripe Rhapsody", "Lausse the Cat")
      track_3 = Track.new("Juggernaut", "Tyler the Creator")
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.search("Redstripe")).to eq [track_2]
    end
  end
end