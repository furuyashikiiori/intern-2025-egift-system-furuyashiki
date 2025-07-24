class Egifts::TopController < Egifts::ApplicationController
  def index
    @items = Item.active.where(published: true)
  end
end
