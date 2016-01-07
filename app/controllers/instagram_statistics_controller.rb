class InstagramStatisticsController < ApplicationController
  before_action :check_tool
  def information

  end

  def save_request
    current_user.requests.create!(text: params[:hashtag])
  end

  def search
    if params[:hashtag] != ''
      @insta = process_search(params[:hashtag], params[:location])
=begin
      current_user.requests.create!(text: params[:hashtag])
=end
      respond_to do |format|
        format.html {redirect_to instagram_url}
        format.js
      end
    else
      redirect_to instagram_url
    end
  end

  private

  def check_tool
    unless current_user.tools.find_by(name: "instagram")
      redirect_to current_user
      flash[:notice] = "You don`t have access to this tool, please check your settings"
    end
  end

  def process_search(hashtags, city)
    hashtags = hashtags.split
    connected_word = ''
    hashtags.each do |hashtag|
      connected_word += hashtag
    end
    hashtags << connected_word
    sorted_media = []
    hashtags.each do |hastag|
      insta_media = Instagram.tag_recent_media(hastag, count: 33)

      ll = Geocoder.search(city)[0].data['geometry']['location']
      lat, lng = ll['lat'], ll['lng']

      insta_media.each do |media|
          unless media.location == nil
            if Geocoder::Calculations.distance_between([lat, lng], [media.location.latitude, media.location.longitude]) < 25
              sorted_media << media
            end
          end
      end
    end
    sorted_media
  end

end
