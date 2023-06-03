class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id != @item.user_id && @item.order == nil
    @items = Item.all
    @order_form = OrderForm.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    if  @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:user_id, :item_id, :zipcode, :prefecture_id, :city, :street, :building, :phone)
  end

end
