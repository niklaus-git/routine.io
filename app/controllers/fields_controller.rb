class FieldsController < ApplicationController
  before_action :set_answer
  before_action :set_field, only: [:save]

  def index
    @routine = @answer.routine
  end

  def new
  end

  def create

  end

  def edit
  end

  def update

  end

  def save
    byebug
    if @field.update(field_params)
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_field
    @field = Field.find_by_question_id_and_answer_id(params[:question_id], @answer.id)
  end

  def field_params
    params.require(:field).permit(:name)
  end
end
