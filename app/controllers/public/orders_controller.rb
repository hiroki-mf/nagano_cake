class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
    @order = Order.new
    @customer = current_customer
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @customer.customer_id = current_customer.id
    @customer = current_customer
  if @order.save
    redirect_to orders_path
  else
    @orders = Order.all
    render :index
  end
  end

  def show
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def complete
  end

  private
  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
