class QuestionsController < ApplicationController
  before_action :set_routine
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    @questions = @routine.questions
  end

  def new
    @question_type = QuestionType.find_by_name(params[:question_type_name])
    @question = @routine.questions.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @question = @routine.questions.new(question_params)
    @question.position = @routine.questions.count + 1
    if @question.save
      respond_to do |format|
        format.html { redirect_to routine_questions_path(@routine) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      respond_to do |format|
        format.html { redirect_to routine_questions_path(@routine) }
        format.js
      end
    end
  end

  def destroy
    @question.delete
    @questions = @routine.questions
    @questions.each_with_index do |question, index|
      question.position = index + 1
      question.save
    end
  end

  def set_routine
    @routine = Routine.find(params[:routine_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:name, :question_type_id)
  end

end
