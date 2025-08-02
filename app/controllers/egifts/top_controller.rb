class Egifts::TopController < Egifts::ApplicationController
  def index
    @items = current_brand.items.active
  end
end
