require 'test_helper'

class UserSignupWorkflowTest < ActionDispatch::IntegrationTest

  test "invalid input should render new template" do
    get "/signup"
    assert_no_difference "Link.count" do
      post users_path, params: { user: { username:  "_0",
                                         email: "      ",
                                         password: "password",
                                         password_confirmation: "password"} }
    end
    assert_template :new
  end

  test "valid input should create a new user and redirect to root" do
    get "/signup"
    assert_difference "User.count", 1 do
      post users_path, params: { user: { username:  "new_user",
                                         email: "user@sample.com",
                                         password: "password",
                                         password_confirmation: "password"} }
    end
    follow_redirect!
    assert_template "/"
    assert_not flash.empty?
  end

  # rails test test/integration/user_signup_workflow_test.rb

end
