require "nokogiri"
require "open-uri"


@link="https://www.mairie-mana.fr"
@doc=Nokogiri::HTML(URI.open(@link))

com=@doc.css('aside.widget.widget_communication ul li a')

com.each do |h|
#date title url image content
mylink=h.attributes['href'].value
p=PressRelease.find_or_initialize_by title: h.text.strip.squish,url: mylink.gsub(@link,'').gsub("/","")
doc2=Nokogiri::HTML(URI.open(mylink))
p.date=doc2.css('.feature-event-date').text
p.content=doc2.css('.content .post p,.content post #gallery-1').map(&:to_html).join('')
p.image=doc2.css('.post-image div a img')[0].attributes['src'].value rescue nil
p.save
doc2.css('.post .gallery .gallery-item div div a img').each do |img|
image=Image.find_or_create_by(name: img.attributes['src'].value)
begin
p.images << image
rescue => e
p e.inspect
end
end

end