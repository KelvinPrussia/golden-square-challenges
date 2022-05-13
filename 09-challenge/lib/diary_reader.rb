class DiaryReader
  def initialize(wpm, diary)
    fail "wpm must be above 0" unless wpm.positive?
    @wpm = wpm
    @diary = diary  
  end

  def find_most_readable_in_time(time)
    return readable_entries(time).max_by do |entry|
      count_words(entry)
    end
    #returns the longest entry that user can 
    #read in the given time
  end

  private

  def readable_entries(time)
    return @diary.entries.reject do |entry|
      calculate_reading_time(entry) > time
    end
  end

  def calculate_reading_time(entry)
    return (count_words(entry) / @wpm.to_f).ceil
  end

  def count_words(entry)
    return 0 if entry.contents.empty?
    return entry.contents.count(" ") + 1
  end
end