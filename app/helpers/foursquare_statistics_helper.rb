module FoursquareStatisticsHelper
  def process_checkins
    client = Foursquare2::Client.new(
        :client_id => '25M3NFZRXPTMY5TVWCC5YK0UX51BOLX1UWJOPCJCOAPTNMHE',
        :client_secret => 'LHXCE0KUXBHLOD4IU5L3R5TWZHAZFP1ELACEHGNQMTO3LZE2',
        :api_version => '20120609')

  end
end
