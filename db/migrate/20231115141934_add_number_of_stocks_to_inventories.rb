class AddNumberOfStocksToInventories < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :number_of_stocks, :integer
  end
end
