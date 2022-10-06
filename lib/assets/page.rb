require "nokogiri"
require "open-uri"
# title url content image date
@link="https://www.mairie-mana.fr"
@doc=Nokogiri::HTML(URI.open(@link))

links=@doc.css('aside.widget.widget_info div p a, nav ul li a, nav ul li ul li a, aside.widget.widget_steps ul li a,aside.widget.widget_links a')
@nbliens=links.length
p "nbliens: #{@nbliens}"
links.each do |link|
mylink=link.attributes['href'].value
k=Post.find_or_initialize_by title: link.text.strip.squish, url: mylink.gsub(@link,"")
k.type ="Info" if link.parent.parent.parent.attributes['class'].value.include?('info')
k.save
if mylink.include?(@link)
doc2=Nokogiri::HTML(URI.open(mylink))
k.image = doc2.css('.post-image div a img')[0].attributes['src'].value rescue nil
k.content = doc2.css('.content .post p').map(&:to_html).join('')
k.save
doc2.css('.post .gallery .gallery-item div div a img').each do |img|
image=Image.find_or_create_by(name: img.attributes['src'].value)
begin
k.images << image
rescue => e
p e.inspect
end
end
end
rescue => e
p e.inspect
p "next link"
next
end