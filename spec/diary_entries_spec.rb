require 'diary_entries'

RSpec.describe DiaryEntry do

  it "returns title" do
    entry = DiaryEntry.new("Thursday 6th May", "Placeholder")
    expect(entry.title).to eq "Thursday 6th May"
  end

  it "returns contents" do
    entry = DiaryEntry.new("Thursday 6th May", "Placeholder")
    expect(entry.contents).to eq "Placeholder"
  end

  it "counts number of words in contents" do
    entry = DiaryEntry.new("Thursday 6th May", "There are seven words in this sentence.")
    expect(entry.count_words).to eq 7
  end

  context "given a wpm of 200" do
    it "returns the ceiling of nukber of minutes it takes to read the contents" do
      entry = DiaryEntry.new("Title", "word " * 550)
      expect(entry.reading_time(200)).to eq 3
    end
  end

  describe
  context "given a wpm of 0" do
    it "raises an error" do
      entry = DiaryEntry.new("Title", "word")
      expect{entry.reading_time(0)}.to raise_error "Invalid wpm"
    end
  end

  describe "#reading_chunk" do
    context "with a contents readable within the time" do
      it "returns the full contents" do
        entry = DiaryEntry.new("Title", "one two three")
        chunk = entry.reading_chunk(200, 1)
        expect(chunk).to eq "one two three"
      end
    end

    context "given a wpm of 0" do
      it "raises an error" do
        entry = DiaryEntry.new("Title", "word")
        expect{entry.reading_chunk(0, 5)}.to raise_error "Invalid wpm"
      end
    end

    context "with a contents not readable in the time" do
      it "returns a readabe chunk" do
        entry = DiaryEntry.new("Title", "one two three")
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

      it "returns the next chunk, next time we are asked" do
        entry = DiaryEntry.new("Title", "one two three")
        entry.reading_chunk(2, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq "three"
      end

      it "restart after reading the whole contents" do
        entry = DiaryEntry.new("Title", "one two three")
        entry.reading_chunk(2, 1)
        entry.reading_chunk(2, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

      it "restarts if it finishes exactly on the end" do
        entry = DiaryEntry.new("Title", "one two three")
        entry.reading_chunk(2, 1)
        entry.reading_chunk(1, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end
    end
  end
end