ENV["TASK_MANAGER_ENV"] ||=  "test"
require 'tilt/erb'
require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
