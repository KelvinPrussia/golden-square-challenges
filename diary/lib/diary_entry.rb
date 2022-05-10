class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents  = contents
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return 0 if @contents.empty?
    return @contents.count(" ") + 1
  end

  def reading_time(wpm)
    fail "wpm must be positive" unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    fail "Invalid wpm" unless wpm >0
    num_words_we_can_read = wpm * minutes
    start_from = @furthest_word_read
    end_at = @furthest_word_read + num_words_we_can_read
    word_list = words[start_from, end_at]
    if end_at >= count_words
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    return word_list.join(" ")
  end
end