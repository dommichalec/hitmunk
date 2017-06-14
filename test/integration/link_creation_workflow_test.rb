require 'test_helper'

class LinkCreationWorkflowTest < ActionDispatch::IntegrationTest

  def setup
    @link = links(:honnold)
  end

  test "should be created with valid information" do
    get new_link_path
    assert_template "links/new"
    # submitting this data should increase the User.count by one
    assert_difference "Link.count", 1 do
      post links_path, params: { link: { title:  "Sample Title",
                                         url: "www.sample.com/article" } }
    end
    follow_redirect!
    assert_template "links/index"
    assert_not flash.empty?
  end

  test "should not be created with blank information" do
    get new_link_path
    assert_template "links/new"
    assert_no_difference "Link.count" do
      post links_path, params: { link: { title:  "      ",
                                         url: "      " } }
    end
   # make sure to render new.html.erb after a failed submission
   assert_template 'links/new'
  end

  test "should not be created with invalid information" do
    get new_link_path
    assert_template "links/new"
    assert_no_difference "Link.count" do
      post links_path, params: { link: { title:  "Sample Article",
                                         url: "http://www.bad_url.com" } }
   end
   # make sure to render new.html.erb after a failed submission
   assert_template 'links/new'
  end
end

# rails test test/integration/link_creation_workflow_test.rb
