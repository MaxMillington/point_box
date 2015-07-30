require_relative '../test_helper'

class RewardTest < ActiveSupport::TestCase

  def test_it_is_recognizes_valid_reward
    assert reward.valid?
  end

  def test_it_is_invalid_without_a_name
    reward = Reward.new(cost: 10)
    refute reward.valid?
  end

  def test_it_is_invalid_without_a_cost
    reward = Reward.new(name: "monkey")
    refute reward.valid?
  end

  def test_it_has_array_of_users
    assert_equal [], reward.users
  end

  def test_no_more_than_one_reward_with_same_name
    woodblock1 = reward.save
    woodblock2 = reward

    refute woodblock2.valid?
  end

  private
  def reward
    Reward.new(name: "Woodblock", cost: 10)
  end
end
