class ToolsController < ApplicationController
  def add
    @tool = Tool.new
    if params[:user][:tool_ids]
      add_to_user_tools
      redirect_to current_user
    else
      render 'users/settings'
    end
  end

  private

  def add_to_user_tools
    assigned_tools = Tool.find( params[:user][:tool_ids])
    @user = User.find(current_user.id)
    @user.tools = assigned_tools
  end
end
