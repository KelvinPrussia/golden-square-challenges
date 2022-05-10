require 'todo_list'

RSpec.describe TodoList do
  context "initially" do
    it "returns empty list" do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
    end

    it "fails when trying to give up" do
      todo_list = TodoList.new
      expect{todo_list.give_up!}.to raise_error "no todos"
    end

    it "fails when trying to get complete todos" do
      todo_list = TodoList.new
      expect{todo_list.complete}.to raise_error "no todos"
    end
  end
end
