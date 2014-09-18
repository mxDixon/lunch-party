require 'test_helper'

class QueueControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get wait" do
    get :wait
    assert_response :success
  end

  test "should get party" do
    get :party
    assert_response :success
  end

end
