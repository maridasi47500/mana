class Postshavepic < ApplicationRecord
belongs_to :post
belongs_to :image
validates_uniqueness_of :post_id, scope: :image_id
end