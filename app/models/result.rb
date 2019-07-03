class Result < ApplicationRecord
  belongs_to :course
  belongs_to :user

  scope :order_by_column, ->(column){order(column)}
end
