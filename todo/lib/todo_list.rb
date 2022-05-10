class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list << todo
  end

  def incomplete
    incomplete_todos = []
    @todo_list.each do |todo|
      if todo.done? == false
        incomplete_todos << todo
      end
    end
    return incomplete_todos
  end

  def complete
    fail "no todos" if @todo_list.empty?
    completed_todos = []
    @todo_list.each do |todo|
      if todo.done? == true
        completed_todos << todo
      end
    end
    return completed_todos
  end

  def give_up!
    fail "no todos" if @todo_list.empty?
    @todo_list.each do |todo|
      todo.mark_done!
    end
  end
end