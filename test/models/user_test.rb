require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase

  def test_it_is_recognizes_valid_user
    assert user.valid?
  end

  def test_it_is_invalid_without_a_username
    user = User.new(password: "password", points: 0, role: 1)
    refute user.valid?
  end

  def test_it_is_invalid_without_a_password
    user = User.new(username: "monkey", points: 0, role: 1)
    refute user.valid?
  end

  def test_it_has_array_of_rewards
    assert_equal [], user.rewards
  end

  def test_no_more_than_one_user_with_same_name
    django1 = user.save
    django2 = user

    refute django2.valid?
  end

  private

  def user
    User.new(username: "Django", password: "password" , points: 0, role: 1)
  end

end
