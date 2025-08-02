class Egifts::OrdersController < Egifts::ApplicationController
  def new
    @item_id = params[:item_id]
    @item = current_brand.items.active.find_by(id: @item_id)

    if @item.nil?
      redirect_to root_path, alert: "指定されたアイテムが見つかりません。"
    end
  end
end
