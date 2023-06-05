class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one    :order
  has_one_attached :image

  validates :image, :item_name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, :price, presence: true

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id,  numericality: { other_than: 1 , message: "can't be blank"} 

  validates :price, presence: true, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999, 
    message: "is invalid" 
  }

end
