class Admin::DashboardController < ApplicationController
  before_action :admin_check
  def index
  end

  def clients
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def tools
    @exist_tools = Tool.all
    @wish_tools = HelpText.paginate(page: params[:page], per_page: 2)
    @tool_help = HelpText.new
  end

  def create_tool
    @tool = HelpText.new(tool_params)
    if @tool.save
      redirect_to admin_path
    else
      render 'tools'
    end
  end

  def edit_tool

  end
  private

  def tool_params
    params.require(:tool_help).permit(:name, :description)
  end

  def admin_check
    redirect_to root_url unless current_user.admin?
  end
end
