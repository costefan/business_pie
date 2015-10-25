class HelpController < ApplicationController
  before_action :check_user
  def main

  end

  private
  def check_user
    redirect_to root_url unless current_user.nil?
  end
end
