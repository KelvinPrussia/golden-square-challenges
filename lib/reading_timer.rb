=begin
  1. Describe the Problem
As a user
So that I can manage my time
I want to see an estimate of reading time for a text, 
assuming that I can read 200 words a minute.

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.

# EXAMPLE

# `reading_timer` counts 1 minute for every 200 words
minutes = reading_timer(words)

words: an integer (e.g. 200)
minutes: an integer (e.g. 1)

# The method returns minutes but doesnt do anything else
3. Create Examples as Tests
Make a list of examples of what the method will take and return.

# EXAMPLE

reading_timer(200) => [1]
reading_timer(100) => [1]
reading_timer(350) => [2]
reading_timer(20000) => [100]
reading_timer(0) => [0]
reading_timer("string") raises an error
reading_timer(nil) throws an error
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
=end
def reading_timer(words)
  fail "Incorrect input" if !words.is_a? Integer
  if words.to_i > 0 && words.to_i< 200
    return 1
  elsif words.to_i % 200 != 0
    temp_num = (words.to_f/100).round()
    return (temp_num * 100) / 200
  else
    return words.to_i/200
  end
  
end