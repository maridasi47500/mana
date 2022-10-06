class Pressreleaseshavepic < ApplicationRecord
belongs_to :press_release
belongs_to :image
validates_uniqueness_of :press_release_id, scope: :image_id
end