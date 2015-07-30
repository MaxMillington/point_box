class Reward < ActiveRecord::Base
  has_many :user_rewards
  has_many :users, through: :user_rewards

  validates :title, presence: true
end
