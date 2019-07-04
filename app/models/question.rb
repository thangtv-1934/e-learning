class Question < ApplicationRecord
  attr_accessor :answers_attributes
  belongs_to :word
  has_many :answers, dependent: :destroy

  scope :in_words, ->(arr_words_id){where word_id: arr_words_id}
  scope :rand, -> {order("RAND()")}
  accepts_nested_attributes_for :answers, allow_destroy: true

  QUESTION_PARAMS = %i(word_id question correct_answer).freeze

  scope :order_by_column, ->(column){order(column)}
  scope :include_word_name, ->{select "questions.*, words.name as word_name"}
  delegate :name, to: :word, prefix: true
end
