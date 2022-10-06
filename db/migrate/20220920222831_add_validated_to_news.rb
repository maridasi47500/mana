class AddValidatedToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :validated, :boolean
  end
end
