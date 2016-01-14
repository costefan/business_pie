class TwitterStatisticsController < ApplicationController
  include TwitterStatisticsHelper
  before_action :check_tool
  def information

  end

  def search
    if params[:hashtag] != ''
      @media = process_media params[:hashtag], params[:location]

      respond_to do |format|
        format.html {redirect_to twitter_url}
        format.js
      end
    else
      redirect_to twitter_url
    end
  end
  private
  def check_tool
    unless current_user.tools.find_by(name: "twitter")
      redirect_to current_user
      flash[:notice] = "You don`t have access to this tool, please check your settings"
    end
  end
end
