class EgiftStores::TopController < EgiftStores::ApplicationController
  def index
    @items = current_brand.items.active.where(status: 't')
  end
end
