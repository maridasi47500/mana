class News < ApplicationRecord
has_many :newshavepics
has_many :images, through: :newshavepics
has_many :newshavecomments
has_many :comments, through: :newshavecomments
def self.limitnb(x)
page=x.to_i == 0 ? 0 : (x.to_i - 1)
all.offset(page*5).limit(5)
end
def date=(x)
monthsen=I18n.t('date.month_names',locale: :en).select{|x|x}.map(&:downcase)
I18n.t('date.month_names',locale: :fr).select{|x|x}.map(&:downcase).each_with_index do |month,i|
x.gsub!(month,monthsen[i])
end
write_attribute(:date,x.to_date)
end
def date
read_attribute(:date)
end
def self.homenews
order(:date => :desc).limit(3)
end
before_validation :saveurl
def saveurl

self.url=self.title.parameterize
end
end