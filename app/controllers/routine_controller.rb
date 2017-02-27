class RoutineController < ApplicationController
  def index
  end

  def new
  end

  def create
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
end
