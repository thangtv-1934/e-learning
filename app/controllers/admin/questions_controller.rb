class Admin::QuestionsController < AdminController
  before_action :load_question, only: %i(show edit update destroy)

  def index
    @questions = Question.includes(:word).page(params[:page]).per(Settings.questions.question_per_page)
      .order_by_column :question
  end

  def create
    @question = Question.new questions_params
    Question.transaction do
      @question.save
      Answer.transaction do
        params[:question][:answers_attributes].each do |answer|
          new_ans = Answer.new content: answer[1][:content], question_id: @question.id
          new_ans.save
        end
        redirect_to edit_admin_question_path(@question)
      end
      rescue
        flash[:danger] = t "question.create_failed"
        render :new
    end
    rescue
      flash[:danger] = t "answer.create_failed"
      render :new
  end

  def new
    @question = Question.new
    Settings.questions.number_answer.times {@question.answers.build}
  end

  def edit
    (Settings.questions.number_answer - @question.answers.size.to_i).times {@question.answers.build}
  end

  def update
    if @question.update questions_params
      flash[:success] = t "question.update_success"
      count = 0
      answers = @question.answers
      answers.each do |answer|
        answer.content = params[:question][:answers_attributes][count.to_s][:content]
        answer.save
        count += 1
        break if count == answers.size
      end
      redirect_to edit_admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "question.delete_success"
      redirect_to admin_questions_path
    else
      render :new
    end
  end

  private

  def load_question
    @question = Question.find_by id: params[:id]
    return if @question
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def questions_params
    params.require(:question).permit Question::QUESTION_PARAMS
  end
end
