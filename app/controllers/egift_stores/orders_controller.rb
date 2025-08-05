class EgiftStores::OrdersController < EgiftStores::ApplicationController
  def new
    @item_id = params[:item_id]
    @item = current_brand.items.active.find_by(id: @item_id)
  end

  def create
    @item = current_brand.items.active.find_by(id: params[:item_id])

    @ticket = @item.tickets.create!(
      brand: current_brand,
      uuid: SecureRandom.uuid
    )

    @ticket.save!

    redirect_to egift_stores_order_path(@ticket)
  end

  def show
    @ticket = current_brand.tickets.find_by(uuid: params[:id])
  end
end
