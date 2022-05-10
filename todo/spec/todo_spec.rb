require 'todo'

RSpec.describe Todo do
  context "creating a todo" do
    it "returns the task as a string" do
      todo = Todo.new("Walk the dog")
      expect(todo.task).to eq "Walk the dog"
    end
  end

  
end