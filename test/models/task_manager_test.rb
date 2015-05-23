require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def create_tasks(num)
    num.times do |x|
      TaskManager.create(title: "task#{x}",
                   description: "description#{x}")
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
    assert_equal ['task0', 'task1'], all_tasks.pop(2).map(&:title)
  end

  def test_can_find_a_task_by_id
    create_tasks(1)
    task = TaskManager.all.last

    assert_equal "task0", task.title
    assert_equal "description0", task.description
  end

  def test_can_update_a_task
    last_title = TaskManager.all.last.title

    data = { title: 'new-ness', description: 'new car smell' }
    TaskManager.create(data)
     
    assert_equal 'new-ness', TaskManager.all.last.title
  end

  def test_can_delete_a_task
    create_tasks(2)

    total = TaskManager.all.count
    last_id = TaskManager.all.last.id  

    TaskManager.delete(last_id)

    assert_equal total - 1, TaskManager.all.size
  end
end
