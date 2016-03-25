#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Prachana"
    xml.author "Team"
    xml.description "Software-Development, Mobiles Devices, Photography"
    xml.link "https://www.gov.in"
    xml.language "en"

    for prob in @probs
      xml.item do
        if prob.pname
          xml.title prob.pname
        else
          xml.title ""
        end
        xml.author "Achim Fischer"
        xml.pubDate prob.created_at.to_s(:rfc822)
        xml.link "https://www.google.com"
        xml.guid prob.pid

        xml.description "<p>" + prob.pstatement.first(100) + "</p>"

      end
    end
  end
end

