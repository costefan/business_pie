class SessionsController < ApplicationController
  before_action :check_user,only: [:new,:create]
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      flash[:success] = "Ok"
      if current_user.admin?
        redirect_to admin_path
      else
        redirect_back_or user
      end
    else
      flash.now[:error] = "Invalid email/password pair"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
