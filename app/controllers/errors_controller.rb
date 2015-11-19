class ErrorsController < ApplicationController
  skip_before_action :check_user
  def error404
    render status: :not_found
  end
end