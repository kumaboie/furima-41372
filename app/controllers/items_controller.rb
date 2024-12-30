class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

    private

    def item_params
      params.require(:item).permit(:image, :title, :detail, :states_id, :category_id, :shipping_fee_status_id, :prefecture_id,
                                   :scheduled_delivery_id, :price_id).merge(user_id: current_user.id)
    end
  end
end
