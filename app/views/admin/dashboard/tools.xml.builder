xml.instruct!
xml.tools do
  @exist_tools.each do |t|
      case t.name
        when 'instagram'
          link = 'http://localhost:3000/instagram'
        when 'twitter'
          link = 'http://localhost:3000/twitter'
        when 'fourquare'
          link = 'http://localhost:3000/foursquare'
      end
      xml.link = link
      xml.name = t.name
      xml.price = 'free'
    end
end