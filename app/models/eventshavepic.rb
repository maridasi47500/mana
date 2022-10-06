class Eventshavepic < ApplicationRecord
belongs_to :event
belongs_to :image
validates_uniqueness_of :event_id, scope: :image_id
end