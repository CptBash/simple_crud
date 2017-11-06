class UserVote < ActiveRecord::Base
  belongs_to :user
  has_one    :robot
end
