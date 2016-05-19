class StaticPagesController < ApplicationController
  skip_before_action :check_user, only: :landing

  def home
    # @services = current_user.services
    # @name = current_user.name
    # @last_sign_in = current_user.last_sign_in_at
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
