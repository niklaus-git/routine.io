class LogsController < ApplicationController
  def index
    @logs = Log.all # no more fake DB
  end
end
