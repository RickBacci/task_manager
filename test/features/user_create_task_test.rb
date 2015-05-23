require_relative '../test_helper.rb'

class CreateNewTaskTest < FeatureTest
  def test_create_new_task
    visit '/tasks/new'
    fill_in 'task[title]', with: 'new task'
    fill_in 'task[description]', with: 'tomorrow'
    click_button 'submit'

    assert page.has_content?('new task')
  end
end
