class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one    :order
  has_one_attached :image

  validates :user, :item_name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, :price, presence: true

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id,  numericality: { other_than: 1 , message: "can't be blank"} 
end
