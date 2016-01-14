class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  skip_before_action :check_user
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    request = current_user.requests.where(from: 'twitter')
    @url = Request.find(request.id)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile was updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def settings
    @tools = Tool.all - current_user.tools
  end


  def destroy
    user = User.find(params[:id])
    if user != current_user
      user.destroy
      flash[:success] = "User deleted"
    end
    redirect_to users_url
  end

  def tasks
    if request.post?
      ProcessWorker.perform_async params[:lat], params[:lng], params[:name]
    else

    end
  end


  def change_locale
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:educator_locale] = l
    redirect_to request.referer || root_url
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url,notice: "Please,sign in" unless signed_in?
    end
  end


  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
