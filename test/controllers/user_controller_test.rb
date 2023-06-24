require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get add_friends" do
    get user_add_friends_url
    assert_response :success
  end
end
