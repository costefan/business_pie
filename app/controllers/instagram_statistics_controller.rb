class InstagramStatisticsController < ApplicationController
  before_action :check_tool
  def information

  end
  private
  def check_tool
    unless current_user.tools.find_by(name: "instagram")
      redirect_to current_user
      flash[:notice] = "You don`t have access to this tool, please check your settings"
    end
  end
end
