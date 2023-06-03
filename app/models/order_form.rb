class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :prefecture_id, :city, :street, :building, :phone
  
  with_options presence: true do
    validates :zipcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'input correctly' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "input only number" }
    validates :prefecture_id, :city, :street
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(
        zipcode: zipcode,
        prefecture_id: prefecture_id,
        city: city,
        street: street,
        building: building,
        phone: phone,)
  end

end
