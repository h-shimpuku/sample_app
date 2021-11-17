require 'test_helper'

class UsersActivationTest < ActionDispatch::IntegrationTest

  def setup
    @login_user = users(:archer)
    @activated_user = users(:michael)
    @non_activated_user = users(:kenji)
  end

  test "Hiding inactive users on the index page" do
    log_in_as(@login_user)
    page_cnt = (User.count - 1) / 30 + 1
    for n in 1..page_cnt do
      get users_path(page:n)
      # assert_select 'a[href=?]', user_path(@activated_user)
      assert_select 'a[href=?]', user_path(@non_activated_user), count: 0
    end
  end

  test "Hiding inactive users on the user page" do
    log_in_as(@login_user)
    get user_path(@non_activated_user)
    assert_redirected_to root_url
  end
end
