class InstagramStatisticsController < ApplicationController
  include InstagramStatisticsHelper
  before_action :check_tool
  before_action :clear_session, only: [:information]

  def information

  end

  def save_request
    current_user.requests.create!(text: params[:hashtag])
  end

  def search
    if params[:hashtag] != ''
      @insta = process_search params[:hashtag], params[:location]
      respond_to do |format|
        format.html {redirect_to instagram_url}
        format.js
      end
    else
      redirect_to instagram_url
    end
  end

  private

  def check_tool
    unless current_user.tools.find_by(name: "instagram")
      redirect_to current_user
      flash[:notice] = "You don`t have access to this tool, please check your settings"
    end
  end

  def clear_session
    session.delete('last_tag_id')
  end

end
