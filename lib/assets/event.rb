require "nokogiri"
require "open-uri"
@url="https://www.mairie-mana.fr"
Event.delete_all
(1..108).each do |t|
if t == 1
@doc=Nokogiri::HTML(URI.open("#{@url}/evenements/agenda"))
else
@doc=Nokogiri::HTML(URI.open("#{@url}/evenements/agenda/page/#{t}"))
end
@doc.css('.section-features .section-feature').each do |e|
@doc1=Nokogiri::HTML(URI.open(e.css('a')[0].attributes['href'].value))
event=Event.find_or_initialize_by title: @doc1.css('h1').text
event.image = @doc1.css('.post-image div a img')[0].attributes['src'].value
dates=@doc1.css('.feature-event .post-date').text.split('Du')[1].split('au')
event.begindate=dates[0]
event.enddate=dates[0]
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
