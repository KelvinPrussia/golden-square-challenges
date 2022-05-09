def get_most_common_letter(text)
  counter = Hash.new(0)
  p "new hash with default key of 0: #{counter}"
  text.chars.each do |char|
  counter[char] += 1
  end
  p "counts each instance of the character"
  #{ |key, value| value} [counter][char]
  p "Makes a new array off arrays [[letter, value], [letter, value]]"
  p "Sorts by the value of each array"
  p "returns the [y] index of the [x] array { |k, v| v }[x][y]"
  counter.to_a.sort_by { |k, v| v }[10][0]
  # [10][0] was [0][0], got the first of 12 indeces instead
  # second to last (space is last since it's most common but
  # not a letter)
end

p get_most_common_letter("the roof, the roof, the roof is on fire!")

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"