class Event < ApplicationRecord
has_many :eventshavepics
has_many :images, through: :eventshavepics
def self.limitnb(x)
page=x.to_i == 0 ? 0 : (x.to_i - 1)
all.offset(page*5).limit(5)
end
def begindate=(x)
monthsen=I18n.t('date.month_names',locale: :en).select{|x|x}.map(&:downcase)
I18n.t('date.month_names',locale: :fr).select{|x|x}.map(&:downcase).each_with_index do |month,i|
x.gsub!(month,monthsen[i])
end
write_attribute(:begindate,x.to_date)
end
def enddate=(x)
monthsen=I18n.t('date.month_names',locale: :en).select{|x|x}.map(&:downcase)
I18n.t('date.month_names',locale: :fr).select{|x|x}.map(&:downcase).each_with_index do |month,i|
x.gsub!(month,monthsen[i])
end
write_attribute(:enddate,x.to_date)
end
def self.homeevents
order(:begindate => :desc).where("begindate > ?",Date.today).limit(5)
end
before_validation :saveurl
def saveurl
self.url=self.title.parameterize
end

end