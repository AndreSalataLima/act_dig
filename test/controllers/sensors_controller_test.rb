require "test_helper"

class SensorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sensors_show_url
    assert_response :success
  end

  test "should get edit" do
    get sensors_edit_url
    assert_response :success
  end
end
