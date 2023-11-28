class AddImageToInventory < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :image, :string
  end
end
