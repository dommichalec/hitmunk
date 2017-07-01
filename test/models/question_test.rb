require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  # use a fixture for setup
  def setup
    @user = users(:dom)
    @question = questions(:one)
  end

  # user tests

  test "a user should be present" do
    @question.user = nil
    assert_equal false, @question.valid?

    @question.user = @user
    assert_equal true, @question.valid?
  end



  # title tests

  test "title should be present" do
    @question.title = "     "
    assert_not @question.valid?
  end

  test "title should not be longer than 50 characters" do
    @question.title = "a"*51
    assert_equal false, @question.valid?
  end

  # body tests

  test "body should be present" do
    @question.body = "      "
    assert_equal false, @question.valid?
  end

  test "body should not be longer than 200 characters" do
    @question.body = "a"*201
    assert_equal false, @question.valid?
  end

  # rails test test/models/question_test.rb
end
