require 'test_helper'

class Api::UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @activated_user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get all users when logged in" do
    log_in_as(@activated_user)
    get api_users_path
    assert_response :success
    assert_match @other_user.to_json, response.body
  end

  test "should not get all users when not logged in" do
    get api_users_path
    assert_redirected_to login_url
  end
end
