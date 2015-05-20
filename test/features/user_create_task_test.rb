require_relative '../test_helper.rb'

class CreateNewTaskTest < FeatureTest
  def test_create_new_task
    visit '/tasks/new'
    fill_in 'task[title]', with: 'new task'
    fill_in 'task[description]', with: 'tomorrow'
    click_button 'submit'

    assert page.has_content?('new task')
  end

  def test_edit_existing_test
    TaskManager.create(title: 'Practice capybara',
                       description: "tonight")
    visit '/tasks'
    click_link "Edit"

    fill_in 'task[title]', with: 'practice sql'
    fill_in 'task[description]', with: 'tomorrow'
    click_on "Update Task"

    assert page.has_content?('practice sql')
    refute page.has_content?('Practice capybara')
  end

  def test_delete_a_task
    TaskManager.create(title: "Practice Capybara",
                       description: 'tonight')
    visit '/tasks'
    click_on "Delete"

    refute page.has_content?("Practice Capybara")
  end
end
