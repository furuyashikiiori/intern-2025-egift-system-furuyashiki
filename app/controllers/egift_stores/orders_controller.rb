class EgiftStores::OrdersController < EgiftStores::ApplicationController
  before_action :set_item, only: [:new, :create]
  
  def new
  end

  def create
    @ticket = @item.tickets.create!(
      brand: current_brand,
      uuid: SecureRandom.uuid
    )

    redirect_to egift_stores_order_path(@ticket.uuid)
  end

  def show
    @ticket = current_brand.tickets.find_by(uuid: params[:id])
  end

  private

  def set_item
    @item = current_brand.items.active.find_by(id: params[:item_id])
  end
end
