class Question < ApplicationRecord
  belongs_to :word
  has_many :answers
end
