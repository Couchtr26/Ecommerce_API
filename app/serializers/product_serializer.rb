class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
  belongs_to :category
end
