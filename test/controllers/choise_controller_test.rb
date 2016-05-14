require 'test_helper'

class ChoiseControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
