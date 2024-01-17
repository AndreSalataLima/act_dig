require "test_helper"

class SessionHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get session_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get session_histories_show_url
    assert_response :success
  end
end
