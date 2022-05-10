class Todo
  def initialize(task) # task is a string
    @task = task
    @completed = false
  end

  def task
    return @task
  end

  def mark_done!
    @completed = true
  end

  def done?
    if @completed == true
      return true
    else
      return false
    end
  end
end