class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def withdrawal
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email, :postal_code, :address, :telephone_number, :email, :first_name_kana, :last_name_kana)
  end

end
