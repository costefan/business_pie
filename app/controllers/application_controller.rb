class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_user
  include SessionsHelper
  private

  def check_user
    redirect_to root_url if current_user.nil?
  end
end
