require 'test_helper'

class PokesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokes_index_url
    assert_response :success
  end

end
