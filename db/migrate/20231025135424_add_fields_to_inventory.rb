class AddFieldsToInventory < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :image_file_name, :string, default: "placeholder.png"
  end
end
