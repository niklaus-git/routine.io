class FieldsController < ApplicationController
  before_action :set_answer
  before_action :set_field, only: [:save]

  def index
    @routine = @answer.routine
    authorize @routine
    skip_policy_scope if @routine.user == current_user
    @questions = @routine.questions.order(:position)
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def goto
    @routine = @answer.routine
    skip_authorization if @routine.user == current_user
    redirect_to answer_fields_path(@routine.go_to(params[:date].to_date))
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_field
    @field = Field.find_by_question_id_and_answer_id(params[:question_id], @answer.id)
  end

  def field_params
    params.require(:field).permit(:answer)
  end
end
