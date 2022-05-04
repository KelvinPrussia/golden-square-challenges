=begin
  1. Describe the Problem
As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter 
and ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature
Include the name of the method, its parameters, return value, 
and side effects.

# EXAMPLE

# `grammar_check` checks for capital letter at the start and 
punctuation at the end of a string
is_correct = grammar_check(sentence)

sentence: a string ("this is  sring")
capital_letters = a string (A..Z)
is_correct: a boolean (true or false)

# The method returns true or false.

3. Create Examples as Tests
Make a list of examples of what the method will take and 
return.

# EXAMPLE

grammar_check("This is correct.") => [true]
grammar_check("This is correct!") => [true]
grammar_check("this is not correct.") => [false]
grammar_check("This is not correct") => [false]
grammar_check("this is not correct") => [false]
grammar_check(100) raises an error
grammar_check(nil) throws an error
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
=end
def grammar_check(sentence)
  capital_letters = ("A".."Z")
  fail "Not a string" if !sentence.is_a? String
  if capital_letters.include?(sentence.chr) && (sentence.end_with?("!", ".", "?"))
    return true
  else
    return false
  end
end