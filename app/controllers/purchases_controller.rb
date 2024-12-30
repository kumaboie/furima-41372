class PurchasesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(purchase_id: @purchase.id)
  end
end
