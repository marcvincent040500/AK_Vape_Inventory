class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :mg_percent
      t.integer :price

      t.timestamps
    end
  end
end
