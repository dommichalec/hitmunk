require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest

  test "should get links index page" do
    get links_url
    assert_response :success
    assert_select "title", "Front Page | #{$SITE_TITLE}"
  end

  test "should get new link page" do
    get new_link_url
    assert_response :success
    assert_select "title", "Add new link | #{$SITE_TITLE}"
  end
end
