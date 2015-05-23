require_relative '../test_helper.rb'

class EditTaskTest < FeatureTest

  def test_edit_existing_test
    TaskManager.create(title: 'Practice capybara',
                       description: "tonight")
    visit '/tasks'
    click_link "Edit"

    fill_in 'task[title]', with: 'practice sql'
    fill_in 'task[description]', with: 'tomorrow'
    click_on "Update Task"

    assert page.should have_selector('h2', text: 'practice sql')
  #  assert page.has_content?('practice sql')
    refute page.has_content?('Practice capybara')
  end
end
