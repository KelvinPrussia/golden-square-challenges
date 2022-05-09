class GrammarStats
  def initialize
    @capital_letters = ("A".."Z")
    @correct_text = []
    @total_text = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    @total_text +=1
    if @capital_letters.include?(text.chr) && (text.end_with?("!", ".", "?"))
      @correct_text << text
      return true
    else
      return false
    end
  end

  def percentage_good
    percentage = ((@correct_text.length.to_f/@total_text)*100).round(2)
    return percentage
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end