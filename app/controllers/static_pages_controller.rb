class StaticPagesController < ApplicationController
  skip_before_filter :check_user, only: :landing

  def home
    # @services = current_user.services
    # @name = current_user.name
    # @last_sign_in = current_user.last_sign_in_at
  end

  def landing
    @users = User.all
  	respond_to do |format|
  	  format.html { render "static_pages/landing" }
  	end
  end

  def help
    pdf_filename = File.join(Rails.root, "12.pdf")
    send_file(pdf_filename, :filename => "12.pdf", :type => "application/pdf")
  end
  
end
