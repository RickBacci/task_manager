require_relative '../test_helper'

class HomePageTest < FeatureTest
  def test_home_page
    visit '/'
    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager!")
    end
  end
end
