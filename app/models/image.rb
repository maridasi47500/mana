class Image < ApplicationRecord
def url
read_attribute(:name).gsub('-150x150','')
end
def self.bypage(x)
page=x.to_i==0 ? 0 : (x.to_i - 1)
all.offset(x*5).limit(5)
end
def self.chooseten
limit(10)
end
end