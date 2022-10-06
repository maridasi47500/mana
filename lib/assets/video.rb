require "nokogiri"
require "open-uri"

@link="https://www.mairie-mana.fr"
(1..11).to_a.map{|h|@link+(h == 1 ? "/video-archive" : "/video-archive/page/#{h}")}.each do |url|
doc=Nokogiri::HTML(URI.open(url))
doc.css('ul.archive-gallery li div a').each do |x|
Video.find_or_create_by(url: x.attributes['href'].value,image: x.css('img')[0].attributes['src'].value)
end
end