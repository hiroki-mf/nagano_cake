class Public::CartItemsController < ApplicationController
  def index
     @cart_items = current_customer.cart_items
  end

  def update
  end

  def create
  end

  def destroy
    cart_items = CartItems.find(params[:id])
    cart_items.destroy
    redirect_to cart_itmes_path
  end

  def all_destroy
    cart_itmes.current_customer.cart_itmes.destroy_all
    redirect_to cart_itmes_path
  end

   private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
