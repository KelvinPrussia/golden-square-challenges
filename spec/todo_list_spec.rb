require 'todo_list'

RSpec.describe TodoList do
  context("adding tasks todo_list") do
    it("adds task to the array") do
      todo_list = TodoList.new()
      expect(todo_list.add_task("get milk")).to eq(["get milk"])
    end
  end 

  context("listing tasks") do
    it("returns an array of task") do
      todo_list = TodoList.new()
      todo_list.add_task("get milk")
      expect(todo_list.task_list()).to eq(["get milk"])
    end
  end

  context("marking task as complete") do
    it("deletes task from the array") do
      todo_list = TodoList.new()
      todo_list.add_task("get milk")
      todo_list.add_task("walk the dog")
      todo_list.task_complete("get milk")
      expect(todo_list.task_list()).to eq(["walk the dog"])
    end
  end
  
  context("fails when task doesn't exist") do
    it("fails..") do
      todo_list = TodoList.new()
      todo_list.add_task("get milk")
      todo_list.add_task("walk the dog")
      todo_list.task_complete("get milk")
      expect{todo_list.task_complete("get milk")}.to raise_error("Task does not exist.")
    end
  end
  
end