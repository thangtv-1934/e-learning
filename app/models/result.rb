class Result < ApplicationRecord
  belongs_to :course
  belongs_to :user

  scope :order_by_column, ->(column){order(column)}

  delegate :name, to: :course, prefix: true
end
