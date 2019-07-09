class WordsController < ApplicationController
  before_action :authenticate_user!

  def index
    course = Course.find_by id: params[:course_id]
    if course
      @words = course.words.page(params[:page]).per Settings.word.word_per_page
      return if @words.empty?
      LearningService.new(current_user, @words.first).mark_learned
    else
      render file: "#{Rails.root}/public/404", status: :not_found
    end
  end

  def view_word
    @learnings = current_user.learnings.includes(:word).page(params[:page]).per Settings.word.word_per_page
  end
end
