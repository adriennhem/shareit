#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Workshopr"
    xml.author "Team Workshopr"
    xml.description "Blog Workshopr"
    xml.link "https://www.workshopr.me"
    xml.language "en"

    for article in @posts
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author "Team Workshopr"
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "https://www.workshopr.me/blog/" + article.id.to_s 
        xml.guid article.id

        text = article.summary
    
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end