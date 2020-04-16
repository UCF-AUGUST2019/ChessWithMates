class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @games = Game.all.paginate(page: params[:page], per_page: 4)
  end

end

