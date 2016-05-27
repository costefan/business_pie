class CheckRequestsController < ApplicationController
	def new
		@check_request = CheckRequest.new
	end

	def create
		# @result = HTTParty.post("http://192.168.131.253:8080/users/#{current_user.id}/check_request", 
		# { 
		#     :body => params[:check_request].to_json,
		#     :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
		# })
		redirect_to root_path
	end
end
