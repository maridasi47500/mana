class Newshavecomment < ApplicationRecord
belongs_to :news
belongs_to :comment
validates_uniqueness_of :news_id, scope: :comment_id
end