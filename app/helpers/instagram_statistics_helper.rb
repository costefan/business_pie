module InstagramStatisticsHelper
  MAXGRAMS = 1000
  def process_search(hashtags, city)
    hashtags = hashtags.split
    connected_word = ''
    hashtags.each do |hashtag|
      connected_word += hashtag
    end
    hashtags << connected_word
    sorted_media = []
    hashtags.each do |hashtag|
      insta_media = process_media(hashtag)

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

  def process_media(hashtag)
    loaded = 0
    grams = []
    if session['last_tag_id']
      next_id = session['last_tag_id']
    else
      first_response = Instagram.tag_recent_media(hashtag)
      first_response.each do |m|
        grams << m
        loaded += first_response.size
      end
      next_id = first_response.pagination.next_max_tag_id
    end
    options = {:next_max_tag_id => next_id}
    while loaded <= MAXGRAMS
      response = Instagram.tag_recent_media(hashtag, options)
      loaded += response.size
      for m in response
        grams << m
      end
      if response.pagination.next_max_tag_id
        options.merge!({:max_tag_id => response.pagination.next_max_tag_id})
      else
        session['last_tag_id'] = response.pagination.next_max_tag_id
        break
      end
    end
    grams

  end

end
