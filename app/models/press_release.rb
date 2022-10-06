class PressRelease < ApplicationRecord
has_many :pressreleaseshavepics
has_many :images, through: :pressreleaseshavepics
has_many :pressreleaseshavecomments
has_many :comments, through: :pressreleaseshavecomments
def self.lastten
limit(10)
end
end