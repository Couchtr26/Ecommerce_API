class Product < ApplicationRecord
  belongs_to :category
  Category.create!(name: "Electronics")
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
