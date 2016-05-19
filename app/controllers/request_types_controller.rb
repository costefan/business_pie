class RequestTypesController < ApplicationController
	before_action :admin_user
	def new
		@request_type = RequestType.new
	end

	def create
		@request_type = RequestType.new(:name => params[:request_type][:name],
		 :keyword => params[:request_type][:keyword], :positive_verb => params[:request_type][:positive_verb],
		 :negative_verb => params[:request_type][:negative_verb])
		if @request_type.save
			redirect_to root_path
		else
			render "new"
		end
	end
	private
	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
