class SessionsController < ApplicationController
  skip_before_action :check_user
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email/password pair"
      render 'static_pages/home'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
