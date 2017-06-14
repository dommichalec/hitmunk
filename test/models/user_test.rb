require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # use a fixture for setup
  def setup
    @user = users(:dom)
  end

  # username tests

  test "username should be present" do
    @user.username = "    "
    @user.save
    assert_not @user.valid?
  end

  test "username leading and trailing whitespace should be stripped" do
    @user.username = "    dom_sample    "
    @user.save
    assert_equal @user.username, "dom_sample"
  end

  test "username leading and trailing white space should be stripped but space between characters should not be valid" do
    @user.username = "    dom_  sample    "
    @user.save
    assert_equal @user.username, "dom_  sample"
    assert_not @user.valid?
  end

  test "username should not have any whitespace" do
    @user.username = "username- dom"
    @user.save
    assert_not @user.valid?
  end

  test "valid usernames should be accepted" do
    valid_usernames = ["dom_sample", " dom%230_0z   ", "user_name   ", "_0_",
                       "...", "us3r_nam3", "   dom   ", "  _valid_!@_username  "]
    valid_usernames.each do |valid_username|
      @user.username = valid_username
      assert @user.valid?, "#{valid_username.inspect} should be valid"
    end
  end


  test "invalid usernames should not be accepted" do
    invalid_usernames = ["_-", "dom sample user", "01", " sample ) ( "]
    invalid_usernames.each do |invalid_username|
      @user.username = invalid_username
      assert_not @user.valid?, "#{invalid_username.inspect} should not be valid"
    end
  end



  test "username can have dashes" do
    @user.username = "username-dom"
    @user.save
    assert @user.valid?
  end

  test "username can have underscores" do
    @user.username = "username_dom"
    @user.save
    assert @user.valid?
  end

  test "username should be unique" do
    user = @user.dup
    @user.save
    assert_not user.valid?
  end

  # email tests

  test "email should be present" do
    @user.email = "     "
    @user.save
    assert_not @user.valid?
  end

  test "email should be unique" do
    user = @user.dup
    @user.save
    assert_not user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be downcase" do
    @user.email = "DOM@exAMPLe.com"
    @user.save
    assert_equal @user.email, "dom@example.com"
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com, foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # password tests

  test "password should be longer than 6 characters" do
    @user.password = "a"*5
    @user.save
    assert_not @user.valid?
  end

  test "password should not have a space in between character" do
    @user.password = "pass word"
    @user.save
    assert_not @user.valid?
  end

  test "password and password confirmation should be the same values" do
    @user.password = "password"
    @user.password_confirmation = "password1"
    @user.save
    assert_not @user.valid?
  end

  # slug tests

  test "slug should be created upon user creation" do
    @user.save
    assert_equal @user.slug, @user.username
  end

  test "slug should update whenever username is updated" do
    @user.username = "himynameisdom"
    @user.save
    assert_equal @user.slug, "himynameisdom"
    @user.update_attributes(username: "something_different")
    @user.save
    assert_equal @user.slug, "something_different"
  end

end
