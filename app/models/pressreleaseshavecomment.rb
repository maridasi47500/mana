class Pressreleaseshavecomment < ApplicationRecord
belongs_to :press_release
belongs_to :comment
valiates_uniqueness_of :press_release_id, scope: :comment_id
end