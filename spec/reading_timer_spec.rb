require 'reading_timer'

RSpec.describe "reading_timer method" do
  it "returns one minute for every 200 words" do
    expect(reading_timer(200)).to eq 1
  end

  context "for anything > 0 and < 200" do
    it "returns one minute" do
      expect(reading_timer(100)).to eq 1
    end
  end

  context "for anything between increments of 200, round up" do
    it "returns as if it was 200" do
      expect(reading_timer(350)).to eq 2
    end
  end

  context "for large numbers" do
    it "returns the correct amount" do
      expect(reading_timer(20000)).to eq 100
    end
  end

  context "for 0 word" do
    it "returns 0 minutes" do
      expect(reading_timer(0)).to eq 0
    end
  end

  context "for anything that isnt an int" do
    it "fails" do
      expect{reading_timer("string")}.to raise_error "Incorrect input"
    end
  end

  context "for nil" do
    it "fails" do
      expect{reading_timer(nil)}.to raise_error "Incorrect input"
    end
  end
end