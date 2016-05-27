class SearchRequestsController < ApplicationController
	def new
		@search_request = SearchRequest.new
	end

	def create
		# @result = HTTParty.post("http://192.168.131.253:8080/users/#{current_user.id}/search_request", 
		# { 
		#     :body => params[:search_request].to_json,
		#     :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
		# })
		redirect_to root_path
	end
end
