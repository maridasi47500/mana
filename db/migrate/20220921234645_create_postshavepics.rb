class CreatePostshavepics < ActiveRecord::Migration[6.0]
  def change
    create_table :postshavepics do |t|
      t.integer :post_id
      t.integer :image_id
    end
  end
end
