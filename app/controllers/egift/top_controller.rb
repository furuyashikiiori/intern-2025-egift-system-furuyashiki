class Egift::TopController < Egift::ApplicationController

  def index
    @items = Item.active.where(published: true)
  end
end
