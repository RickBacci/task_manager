class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == "test"
      @database ||= Sequel.sqlite('db/task_manager_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/task_manager.sqlite3')
    end
  end

  def self.create(task)
     dataset.insert(title: task[:title], description: task[:description])
  end

  def self.all
    dataset.map { |data| Task.new(data) }
  end
  
  def self.find(id)
    task = dataset.where(id: id)
    Task.new(task.first.to_a)
  end

  def self.update(id, data)
    dataset.where(id: id).update(data)
  end

  def self.delete(id)
    dataset.where(id: id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from(:tasks)
  end
end
