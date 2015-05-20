require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def create_tasks(num)
    num.times do |x|
      TaskManager.create(title: "task#{x}",
                   description: "description#{x}")
    end
  end

  def test_can_create_a_task
    data = { :title => "learn sinatra",
             :description => "seriously.",
             :id => 1}

    TaskManager.create(data)
    task = TaskManager.find(1)

    assert_equal "learn sinatra", task.title
    assert_equal "seriously.", task.description
    assert_equal 1, task.id
  end

  def test_can_display_all_tasks
    create_tasks(2)
    all_tasks = TaskManager.all
    assert_equal ['task0', 'task1'], all_tasks.map(&:title)
  end

  def test_can_find_a_task_by_id
    create_tasks(5)
    task = TaskManager.find(2)

    assert_equal "task1", task.title
    assert_equal "description1", task.description
    assert_equal 2, task.id
  end

  def test_can_update_a_task
    create_tasks(1)
    task = TaskManager.find(1)

    assert_equal "task0", task.title
    assert_equal "description0", task.description

    data = { :title => "i've changed",
             :description => 'me too' }

    task = TaskManager.update(1, data)
    task = TaskManager.find(1)
    assert_equal "i've changed", task.title
  end

  def test_can_delete_a_task
    create_tasks(3)
    assert_equal 2,  TaskManager.delete(1).count
  end
end
