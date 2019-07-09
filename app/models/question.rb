class Question < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy

  scope :in_words, ->(arr_words_id){where word_id: arr_words_id}
  scope :rand, -> {order("RAND()")}
end
