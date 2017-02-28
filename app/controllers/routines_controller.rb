class RoutinesController < ApplicationController
  def index
  end

  def new
    @routine = Routine.new
    @question_type = Question_type.new
  end

  def create
    @routine = Routine.new(routine_params)
    @question_type = Question_type.new(question_params)
    if @routine.save
      redirect_to routine_path()
    else
      render 'routine/show'
    end

  end

  def show
    @routine = Routine.find(params[:id])
    @questions = @routine.questions

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def routine_params
    # routine params will have the user questions
    params.require(:name)
  end

  def question_params
    # question params
  end
end
