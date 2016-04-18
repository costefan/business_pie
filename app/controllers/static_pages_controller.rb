class StaticPagesController < ApplicationController
  skip_before_action :check_user
  def home
  end

  def landing
    @users = User.all
  	respond_to do |format|
  	  format.html { render "static_pages/landing" }
  	end
  end

  def help
  end
end
