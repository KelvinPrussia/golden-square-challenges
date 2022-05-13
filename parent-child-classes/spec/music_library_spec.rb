require 'music_library'

RSpec.describe MusicLibrary do
  context "initially" do
    it "returns an empty track list" do
      library = MusicLibrary.new
      expect(library.all).to eq []
    end
    it "returns the added tracks in a list" do
      library = MusicLibrary.new
      track_1 = double(:track, matches?: true)
      track_2 = double(:track, matches?: true)
      track_3 = double(:track, matches?: false)
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.all).to eq [track_1, track_2, track_3]
    end
    it "returns the added tracks in a list that match the keyword" do
      library = MusicLibrary.new
      track_1 = double(:track, matches?: true)
      track_2 = double(:track, matches?: true)
      track_3 = double(:track, matches?: false)
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.search("keyword")).to eq [track_1, track_2]
    end
  end
end