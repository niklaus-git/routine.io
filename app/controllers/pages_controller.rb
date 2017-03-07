class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :team ]
  layout "home", only: :home
  def home
  end

  def team
  end
end
