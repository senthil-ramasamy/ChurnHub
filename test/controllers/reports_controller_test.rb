require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get test" do
    get :test
    assert_response :success
  end

  test "should get train" do
    get :train
    assert_response :success
  end

end
