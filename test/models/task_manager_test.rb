require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def create_tasks(num)
    TaskManager.destroy_database
    num.times do |x|
      TaskManager.create(title: "task#{x + 1}",
                   description: "description#{x + 1}")
    end
  end

  def test_can_create_a_task
    data = { title: "learn sinatra",
       description: "seriously." }

    TaskManager.create(data)
    task = TaskManager.all.last
    
    assert_equal "learn sinatra", task.title
    assert_equal "seriously.", task.description
  end

  def test_can_display_all_tasks
    create_tasks(2)
    all_tasks = TaskManager.all
    assert_equal ['task1', 'task2'], all_tasks.pop(2).map(&:title)
  end

  def test_can_find_a_task_by_id
    create_tasks(1)
    task = TaskManager.find(1)
    assert_equal "task1", task.title
    assert_equal "description1", task.description
  end

  def test_can_update_a_task
    create_tasks(1)

    data = { title: 'new-ness', description: 'new car smell' }
    TaskManager.update(1, data)
    refute_equal 'task1', TaskManager.all.first.title
    assert_equal 'new-ness', TaskManager.all.first.title
  end

  def test_can_delete_a_task
    create_tasks(2)

    total = TaskManager.all.count
    last_id = TaskManager.all.last.id  

    TaskManager.delete(last_id)

    assert_equal total - 1, TaskManager.all.size
  end
end
