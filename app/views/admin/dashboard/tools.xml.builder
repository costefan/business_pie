xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Reviews"
    xml.description "A reviews from my app"
    xml.link reviews_url

    for tool in @exist_tools
      xml.item do
        xml.title tool.name
        xml.description tool.description
        xml.pubDate tool.created_at.to_s(:rfc822)
      end
    end
  end
end