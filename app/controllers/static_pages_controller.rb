class StaticPagesController < ApplicationController
  skip_before_action :check_user
  def home
  end

  def help
  end
end
