require 'test_helper'

class InvalidPageWorkflowTest < ActionDispatch::IntegrationTest

  test "trying to access an invalid url should redirect back to root path" do
    get "/some%20invalid%20path"
    follow_redirect!
    assert_template "links/index"
    assert_not flash.empty?
    assert_response :success
  end

  # rails test test/integration/invalid_page_workflow_test.rb

end
