class AddCommentIdToComments < ActiveRecord::Migration[6.0]
  def change
    create_table :commentshavecomments do |t|
	t.integer :comment_id
	t.integer :othercomment_id
	end
  end
end
