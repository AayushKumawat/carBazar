require "test_helper"

class SellsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sells_index_url
    assert_response :success
  end
end
