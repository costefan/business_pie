class CheckRequestsController < ApplicationController
	def new
		@check_request = CheckRequest.new
	end

	def create
		#HTTParty.post("http://127.0.0.1:8080/users/#{current_user.id}/search_request", params)
		redirect_to root_path
	end
end
