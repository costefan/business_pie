class CheckRequestsController < ApplicationController
	before_action :major
	def new
		@check_request = CheckRequest.new
	end

	def create
		current_user.spend_service("check_request")
		@result = HTTParty.post("http://192.168.1.102:8080/users/#{current_user.id}/check_request", 
		{ 
		    :body => params[:check_request].to_json,
		    :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
		})

		redirect_to root_path
	end
	private
 	def major
 		redirect_to(root_url) unless current_user.have_service?("check_request")
 	end
end
