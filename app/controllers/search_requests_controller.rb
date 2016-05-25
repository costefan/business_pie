class SearchRequestsController < ApplicationController
	def new
		@search_request = SearchRequest.new
	end

	def create
		# HTTParty.post("http://127.0.0.1:8080/users/#{current_user.id}/search_request", 
		# { 
		#     :body => params[:search_request].to_json,
		#     :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
		# })
		params[:search_request]
		params[:service] = RequestType.find(params[:search_request][:request_type])
		render "static_pages/home"
	end
end
