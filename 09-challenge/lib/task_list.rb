class TaskList
  def initialize
    @tasks = []
  end

  def add_task(task) 
    @tasks << task
  end

  def all
    return @tasks
  end
end