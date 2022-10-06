class Newshavepic < ApplicationRecord
belongs_to :news
belongs_to :image
validates_uniqueness_of :news_id, scope: :image_id
end