class Egift::TopController < ApplicationController
  layout "egift"

  def index
    @items = Item.active.where(published: true)
  end
end
