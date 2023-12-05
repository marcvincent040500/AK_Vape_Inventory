class Inventory < ApplicationRecord
  validates :name, :mg_percent, { presence: true }
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :image_file_name, format: {
      with: /\w+\.(jpg|png)\z/i,
      message: "must be a JPG or PNG image"
    }
  validates :number_of_stocks, presence: true

  has_one_attached :image
end
