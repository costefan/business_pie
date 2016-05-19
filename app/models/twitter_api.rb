class TwitterApi
  require 'twitter'
	def self.trending_tweets
		client.trends_closest(options = {})
	end

	def self.client
	    @client = Twitter::REST::Client.new do |config|
	      config.consumer_key        = "Sh6bTtrbYBlukyusSBg7jkouD"
	      config.consumer_secret     = "BhUkCjZn936aMsxHmadC1SaOcE1TqpCpWAx8WL29DeVdCfhkx9"
	      config.access_token        = "713040362567307264-JwUDLLbHjknpT3I6FqR5jvZ6cLrqhYC"
	      config.access_token_secret = "sjBlCJnU9lOqEIRwU0kI00ULkwzniSVsZyv07WMksQacz"
	    end

	end
end
