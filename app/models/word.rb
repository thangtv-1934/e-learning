class Word < ApplicationRecord
  belongs_to :course
  has_many :questions
  has_many :learnings
end
