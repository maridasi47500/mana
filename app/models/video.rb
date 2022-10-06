class Video < ApplicationRecord
def self.bypage(x)
page=x.to_i==0 ? 1 : (x.to_i - 1)
all.offset(x*5).limit(5)
end
def self.lastfive
limit(5)
end
end