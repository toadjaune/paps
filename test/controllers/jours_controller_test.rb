require 'test_helper'

class JoursControllerTest < ActionController::TestCase
  test "should get crud" do
    get :crud
    assert_response :success
  end

end
