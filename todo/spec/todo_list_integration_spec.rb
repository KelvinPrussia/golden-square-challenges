require 'todo_list'
require 'todo'

RSpec.describe "integration" do
  it "lists incomplete todos" do
    todo_list = TodoList.new
    todo_1 = Todo.new("Walk the dog")
    todo_2 = Todo.new("Buy milk")
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    expect(todo_list.incomplete).to eq [todo_1, todo_2]
  end

  context "only one complete todo" do
    it "lists complete todos" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Walk the dog")
      todo_2 = Todo.new("Buy milk")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      expect(todo_list.complete).to eq [todo_1]
    end
  end

  context "all todo complete" do
    it "lists all todos" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Walk the dog")
      todo_2 = Todo.new("Buy milk")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      todo_2.mark_done!
      expect(todo_list.complete).to eq [todo_1, todo_2]
    end
  end

  it "marks all todos as complete" do
    todo_list = TodoList.new
      todo_1 = Todo.new("Walk the dog")
      todo_2 = Todo.new("Buy milk")
      todo_3 = Todo.new("Pay bills")
      todo_4 = Todo.new("Call dentist")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      todo_list.give_up!
      expect(todo_list.complete).to eq [todo_1, todo_2, todo_3, todo_4]
  end
end