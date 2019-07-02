class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :courses, dependent: :destroy
  has_many :learnings, dependent: :destroy
  has_many :results, dependent: :destroy
end
