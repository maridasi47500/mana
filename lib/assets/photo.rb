require "nokogiri"
require "open-uri"
@link="https://www.mairie-mana.fr"
(1..16).to_a.map{|h|@link+(h == 1 ? "/photo-archive" : "/photo-archive/page/#{h}")}.each do |url|
doc=Nokogiri::HTML(URI.open(url))
doc.css('.archive-gallery li a img').each do |img|
Image.find_or_create_by(name: img.attributes['src'].value)
end
end