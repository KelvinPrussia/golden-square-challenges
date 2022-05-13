require 'diary'
require 'diary_entry'
require 'diary_reader'
require 'phone_number_crawler'

RSpec.describe "diary integration" do
  it "adds diary entries to the list" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("my title", "my contents")
    diary_entry_2 = DiaryEntry.new("my title two", "my contents two")
    diary.add_entry(diary_entry_1)
    diary.add_entry(diary_entry_2)
    expect(diary.entries).to eq [diary_entry_1, diary_entry_2]
  end

  describe "diary reading behaviour" do
    context "where there is a perfect diary entry to read in the time" do
      it "finds that entry" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        diary_entry_1 = DiaryEntry.new("title1", "one")
        diary_entry_2 = DiaryEntry.new("title2", "one two")
        diary_entry_3 = DiaryEntry.new("title3", "one two three")
        diary_entry_4 = DiaryEntry.new("title4", "one two three four")
        diary_entry_5 = DiaryEntry.new("title5", "one two three four five")
        diary.add_entry(diary_entry_1)
        diary.add_entry(diary_entry_2)
        diary.add_entry(diary_entry_3)
        diary.add_entry(diary_entry_4)
        diary.add_entry(diary_entry_5)
        expect(reader.find_most_readable_in_time(2)).to eq diary_entry_4
      end
    end

    context "where the best entry is a bit shorter than optimum" do
      it "finds that entry" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        diary_entry_1 = DiaryEntry.new("title1", "one")
        diary_entry_2 = DiaryEntry.new("title2", "one two")
        diary_entry_3 = DiaryEntry.new("title3", "one two three")
        diary_entry_4 = DiaryEntry.new("title4", "one two three four five")
        diary.add_entry(diary_entry_1)
        diary.add_entry(diary_entry_2)
        diary.add_entry(diary_entry_3)
        diary.add_entry(diary_entry_4)
        expect(reader.find_most_readable_in_time(2)) #=> [diary_entry_3]
      end
    end

    context "where there is nothing redable in the time" do
      it "returns nil" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        diary_entry_1 = DiaryEntry.new("title1", "one two three four five")
        diary.add_entry(diary_entry_1)
        expect(reader.find_most_readable_in_time(2)).to eq nil
      end
    end

    context "when there are no entries at all" do
      it "retuns nil" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        expect(reader.find_most_readable_in_time(2)).to eq nil
      end
    end

    context "when wpm is invalid" do
      it "fails" do
        diary = Diary.new
        expect{DiaryReader.new(0, diary)}.to raise_error "wpm must be above 0"
      end
    end
  end

  describe "phone number extraction behaiour" do
    it "extracts phone numbers from all diary entries" do
      diary = Diary.new
      phone_book = PhoneNumberCrawler.new(diary)
      diary.add_entry(DiaryEntry.new("title0", "my friend is cool"))
      diary.add_entry(DiaryEntry.new("title1", "my friend 07800000000 is cool"))
      diary.add_entry(DiaryEntry.new("title2", "my friends 07800000000, 07800000001, 07800000002 and 07800000002 are cool"))
      expect(phone_book.extract_numbers).to eq [
        "07800000000",
        "07800000001",
        "07800000002"
      ]
    end

    it "doesnt extract invalid number" do
      diary = Diary.new
      phone_book = PhoneNumberCrawler.new(diary)
      diary.add_entry(DiaryEntry.new("title1", "my friend 0780000000 17800000000 is cool"))
      expect(phone_book.extract_numbers).to eq []
    end
  end
end