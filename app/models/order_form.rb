class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :prefecture_id, :city, :street, :building, :phone, :token
  
  validates :zipcode, :prefecture_id, :city, :street, :phone, presence: true


  def save
    # 各テーブルにデータを保存する処理を書く
  end

end
