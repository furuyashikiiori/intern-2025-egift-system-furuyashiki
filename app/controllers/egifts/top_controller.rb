class Egifts::TopController < Egifts::ApplicationController
  def index
    @items = Item.active
  end
end
