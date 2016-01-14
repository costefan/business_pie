module TwitterStatisticsHelper
  require 'twitter'

  def process_media(name, location)
    ll = Geocoder.search(location)[0].data['geometry']['location']
    lat, lng = ll['lat'], ll['lng']
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'sSFfCnVNQlwYZsvzd12K1DpM5'
      config.consumer_secret     = 'xTLzC4jCOfHLWU26Qarqi2orV1rpyRZ1H95Qsm1JeVooz3dhns'
      config.access_token        = '4058691645-I1Yqe21bjabJS5yj1FIQPVX4BV1nDqYnVZxViwn'
      config.access_token_secret = 'RAW6vI2nsHkGaF6ks4wIalx4TR4m39wxa5HApDQAoShu1'
    end

    geocode = lat.to_s + ',' + lng.to_s + ',' + '20km'
    client.search(name, {geocode: geocode}).take(40)

  end

end
