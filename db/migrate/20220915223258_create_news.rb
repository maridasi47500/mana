class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :url
      t.string :image
      t.text :content
      t.date :date
      t.timestamps
    end
	create_table :newshavepics do |t|
	t.integer :image_id
	t.integer :news_id
	end
	create_table :images do |t|
	t.string :name
	t.timestamps
	end
	create_table :newshavecomments do |t|
	t.integer :comment_id
	t.integer :news_id
	end
	create_table :comments do |t|
	t.text :message
	t.string :name
	t.string :email
	t.timestamps
	end
	create_table :press_releases do |t|
	t.date :date
	t.string :title
	t.string :url
	t.string :image
	t.text :content
	t.timestamps
	end
	create_table :pressreleaseshavecomments do |t|
	t.integer :comment_id
	t.integer :press_release_id
	end
    create_table :events do |t|
      t.string :title
      t.string :url
      t.string :image
      t.text :content
      t.date :begindate
      t.date :enddate
      t.timestamps
    end
	create_table :eventshavecomments do |t|
	t.integer :comment_id
	t.integer :event_id
	end
	create_table :eventshavepics do |t|
	t.integer :image_id
	t.integer :event_id
	end
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :image
      t.text :content
      t.date :date
      t.timestamps
    end
	create_table :postshavecomments do |t|
	t.integer :comment_id
	t.integer :post_id
	end
  end
end
