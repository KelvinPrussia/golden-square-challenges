require 'track'

RSpec.describe Track do
  it "matches when given a keyword in the title" do
    track = Track.new("Leon the Professional", "Knucks")
    expect(track.matches?("Leon")).to eq true
  end
end