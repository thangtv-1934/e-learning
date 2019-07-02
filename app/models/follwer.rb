class Follwer < ApplicationRecord
  belongs_to :follower_id, class_name: User.name
  belongs_to :followed_id, class_name: User.name
end
