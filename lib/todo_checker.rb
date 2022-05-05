=begin
  1. Describe the Problem
As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

2. Design the Method Signature
Include the name of the method, its parameters, return value, 
and side effects.

# EXAMPLE

# `todo_checker` checks whether "#TODO is included 
in a string"
is_todo = todo_checker(text)

text: a string ("this is  string")
is_todo: a boolean (true/false)
text_words: an array (["this", "is", "an", "array"])
 
# The method returns true or false.

3. Create Examples as Tests
Make a list of examples of what the method will take and 
return.

# EXAMPLE

todo_checker("#TODO Walk the dog") => [true]
todo_checker("Buy some milk #TODO") => [true]
todo_checker("Walk the dog") => [false]
todo_checker(100) raises an error
todo_checker(nil) raises an error
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
=end
def todo_checker(text)
  fail "No input" if text.nil?
  fail "Wrong input" if !text.is_a? String
  text_words = text.split(" ")
  text_words.include?"#TODO"
end
