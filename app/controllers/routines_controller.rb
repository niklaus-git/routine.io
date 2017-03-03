class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy, :submit]

  def index
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = current_user.routines.new(routine_params)
    if @routine.save
      redirect_to routine_questions_path(@routine)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def submit
    prepare_answer
    redirect_to answer_fields_path(@answer)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def routine_params
    params.require(:routine).permit(:name)
  end

  def prepare_answer
    @answer = @routine.answers.create
    @routine.questions.each do |question|
      field = @answer.fields.new(question_id: question.id, answer_id: @answer.id)
      field.save
    end
  end
end
