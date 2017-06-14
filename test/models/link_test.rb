require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  # use a fixture for setup
  def setup
    @link = links(:honnold)
  end

  # title tests

  test "title should be present" do
    @link.title = "   "
    assert_not @link.valid?
  end

  test "title should be unique" do
    @new_link = links(:kagan)
    @new_link.title = @link.title.dup # creates a duplicate link with the same attributes
    @link.save
    assert_not @new_link.valid?
  end

  # url tests

  test "url should be present" do
    @link.url = "    "
    assert_not @link.valid?
  end

  test "url should be downcased" do
    @link.url = "HTTPS://wWw.exAmple.com"
    @link.save
    assert_equal "https://www.example.com", @link.reload.url
  end

  test "url validation should accept good urls" do
    valid_urls = %w[https://www.example.com?example=valid https://www.example.io
                    https://www.example.com/category/this%20should%20be%20valid
                    www.example.com/news/this-should-work
                    www.this-url-should-work.com/example%20story
                    http://www.example.org/exmple/example-text.txt]
    valid_urls.each do |valid_url|
      @link.url = valid_url
      assert @link.valid?, "#{valid_url.inspect} should be invalid"
    end
  end

  test "url validation should reject bad urls" do
  invalid_urls = %w[http://www.bad_url.com htp://ww.bad-url..com www..badurl.com
                           httpss:www.bad-url.com htpps://bad-url.io,
                           https://www.bad@url_site.com
                           https://www.this_should_not_work.com/home
                           httPx://www.badurl.c0m httPx://www.badurl.com
                           gttp://ww.example.org]
    invalid_urls.each do |invalid_url|
      @link.url = invalid_url
      assert_not @link.valid?, "#{invalid_url.inspect} should be invalid"
    end
  end

  test "url should be unique" do
    @new_link = links(:kagan)
    @new_link.url = @link.url.dup # creates a duplicate link with the same attributes
    @link.save
    assert_not @new_link.valid?
  end
end
