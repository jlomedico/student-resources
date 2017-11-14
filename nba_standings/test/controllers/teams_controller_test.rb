require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  test "should get league" do
    get :league
    assert_response :success
  end

  test "should get eastern_conf" do
    get :eastern_conf
    assert_response :success
  end

  test "should get western_conf" do
    get :western_conf
    assert_response :success
  end

end
