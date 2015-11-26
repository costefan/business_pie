xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Tools"
    xml.description "A tools from my app"

    for tool in @exist_tools
      xml.item do
        case t.name
          when 'instagram'
            link = 'http://localhost:3000/instagram'
          when 'twitter'
            link = 'http://localhost:3000/twitter'
          when 'fourquare'
            link = 'http://localhost:3000/foursquare'
        end
        xml.link = link

        xml.name = tool.name
        xml.pubDate tool.created_at.to_s(:rfc822)
      end
    end
    end
  end
