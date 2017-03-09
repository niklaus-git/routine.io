class AnswersController < ApplicationController
  before_action :set_answer, only: [:update, :show]
  def new
  end

  def create
  end

  def show
    @routine = @answer.routine
    authorize @routine
    skip_policy_scope if @routine.user == current_user
    @questions = @routine.questions.order(:position)
  end

  def read
  end

  def edit
  end

  def update
    @routine = @answer.routine
    skip_authorization if @routine.user == current_user
    @answer.fields.each do |field|
      field.name = params["#{field.question_id}"]
      field.save
    end
    redirect_to answer_fields_path(@answer)
  end

  def destroy
  end

  def goto
    @answer = Answer.find(params[:answer_id])
    @routine = @answer.routine
    skip_authorization if @routine.user == current_user
    redirect_to answer_path(@routine.go_to(params[:date].to_date))
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
