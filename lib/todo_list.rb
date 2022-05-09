=begin
1. Describe the Problem
As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

2. Design the Class Interface
Include the initializer and public methods with all 
parameters and return values.

# EXAMPLE
=end
class TodoList
  def initialize
    @todo_list = []
  end
 
  def add_task(task) # task is a string
    # adds a task to an array
    @todo_list.push(task)
  end

  def task_list()
    return @todo_list
    # prints/returns idk a list of tasks
  end

  def task_complete(task)
    fail("Task does not exist.") if !@todo_list.include?(task)  
    @todo_list.delete(task)

    # remove the task from the array
  end

end
=begin
3. Create Examples as Tests
Make a list of examples of how the class will behave in 
different situations.

# EXAMPLE
# 1
todo_list = TodoList.new
todo_list.add_task("Walk the dog")
todo_list.task_list # => "Walk the dog"

# 2
todo_list = TodoList.new
todo_list.add_task("Buy milk")
todo_list.add_task("Walk the dog")
todo_list.complete_task("Buy ilk") # => "Walk the dog"

Encode each example as a test. You can add to the above list 
as you go.
4. Implement the Behaviour
After each test you write, follow the test-driving process of 
red, green, refactor to implement the behaviour.
=end