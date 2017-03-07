class AnswersController < ApplicationController
  before_action :set_answer, only: [:update]
  def new
  end

  def create
  end

  def show
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

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
