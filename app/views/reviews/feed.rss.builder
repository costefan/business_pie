xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Reviews"
    xml.description "A reviews from my app"
    xml.link reviews_url

    for review in @all_reviews
      xml.item do
        xml.title review.user.name
        xml.description review.text
        xml.pubDate review.created_at.to_s(:rfc822)
      end
    end
  end
end