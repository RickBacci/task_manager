require_relative '../test_helper.rb'

class DeleteTaskTest < FeatureTest

  def test_delete_a_task
    TaskManager.create(title: "Practice Capybara",
                       description: 'tonight')
    visit '/tasks'
    click_on "Delete"

    refute page.has_content?("Practice Capybara")
  end
end
