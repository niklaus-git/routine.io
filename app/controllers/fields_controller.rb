class FieldsController < ApplicationController
  before_action :set_answer

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

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end
end
