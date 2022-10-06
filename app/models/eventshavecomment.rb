class Eventshavecomment < ApplicationRecord
belongs_to :event
belongs_to :comment
validates_uniqueness_of :event_id, scope: :comment_id 
end