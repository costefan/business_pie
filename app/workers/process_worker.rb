require 'google_chart'
require 'twitter'
class ProcessWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  sidekiq_options queue: "high"

  def perform(lat, lng, name)
    user = User.find(2)

    Array insta_media = Instagram.media_search(lat, lng)
    unless insta_media.empty?

      insta_media.each do |m|
        user.requests.create!(text: m.caption.text.to_s,
                              url: m.images.standard_resolution.url,
                              from: 'instagram'
        )

      end

    end


    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'sSFfCnVNQlwYZsvzd12K1DpM5'
      config.consumer_secret     = 'xTLzC4jCOfHLWU26Qarqi2orV1rpyRZ1H95Qsm1JeVooz3dhns'
      config.access_token        = '4058691645-I1Yqe21bjabJS5yj1FIQPVX4BV1nDqYnVZxViwn'
      config.access_token_secret = 'RAW6vI2nsHkGaF6ks4wIalx4TR4m39wxa5HApDQAoShu1'
    end


    timezones = 0.0
    tweetlocation = Hash.new

    cursor = '-1'
    while cursor != 0 do

      followers = begin
        client.follower_ids(name, cursor: cursor)
      rescue Twitter::Error::TooManyRequests => e
        sleepy_time = e.rate_limit.reset_in + 1
        Rails.logger.debug("following - sleeping #{sleepy_time}")
        sleep sleepy_time
        retry
      end
      followers.attrs[:ids].each do |fid|

        f = client.user(fid)

        loc = f.time_zone.to_s

        if loc.length > 0

          if tweetlocation.has_key?(loc)
            tweetlocation[loc] += 1
          else
            tweetlocation[loc] = 1
          end

          timezones += 1.0

        end
      end

      cursor = followers.attrs[:next_cursor]

    end

    chart_url = create_chart tweetlocation, timezones

    user.requests.create!(text: 'some text',
                          url: chart_url.to_url,
                          from: 'twitter'
                          )


  end


  def create_chart(tweetlocation, timezones)
    GoogleChart::PieChart.new('650x350', "Time Zones", false ) do |pc|

      tweetlocation.each do |loc,count|
        pc.data loc.to_s.delete("&"), (count/timezones*100).round
      end

      pc
    end
  end

end