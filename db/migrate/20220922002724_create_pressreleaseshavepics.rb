class CreatePressreleaseshavepics < ActiveRecord::Migration[6.0]
  def change
    create_table :pressreleaseshavepics do |t|
      t.integer :image_id
      t.integer :press_release_id
    end
  end
end
