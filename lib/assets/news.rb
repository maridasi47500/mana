require "nokogiri"
require "open-uri"
News.delete_all
@url="https://www.mairie-mana.fr"
(1..131).each do |t|
if t == 1
@doc=Nokogiri::HTML(URI.open("#{@url}/actualites"))
else
@doc=Nokogiri::HTML(URI.open("#{@url}/actualites/page/#{t}"))
end
@doc.css('.section-features .section-feature').each do |e|
@doc1=Nokogiri::HTML(URI.open(e.css('a')[0].attributes['href'].value))
event=News.find_or_initialize_by title: @doc1.css('h1').text
event.image = @doc1.css('.post-image div a img')[0].attributes['src'].value rescue nil
dates=@doc1.css('.feature-event .feature-event-date').text.strip.squish rescue nil
event.date=dates
event.content=@doc1.css('.post p').map(&:to_html).join('')
event.save
@doc1.css('.post .gallery .gallery-item div div a img').each do |img|
image=Image.find_or_create_by(name: img.attributes['src'].value)
begin
event.images << image
rescue => e
p e.inspect
end
end
event.save



end 
end
