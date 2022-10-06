class Post < ApplicationRecord
has_many :postshavepics
has_many :images, through: :postshavepics
def self.findbypath(path)
where("url like ?","%"+path+"%")[0]
end
end
