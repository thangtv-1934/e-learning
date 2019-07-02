class Course < ApplicationRecord
  belongs_to :user
  has_many :words
  has_many :results
end
