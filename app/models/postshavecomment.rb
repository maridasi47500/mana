class Postshavecomment < ApplicationRecord
belongs_to :post
belongs_to :comment
validates_uniqueness_of :post_id, scope: :comment_id
end