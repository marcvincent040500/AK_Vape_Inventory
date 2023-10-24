class AddMissionVisionHome < ActiveRecord::Migration[7.1]
  def change
    add_column :homes, :mission, :string
    add_column :homes, :vision, :string
  end
end
