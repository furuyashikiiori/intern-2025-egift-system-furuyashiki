class EgiftStores::TopController < EgiftStores::ApplicationController
  def index
    sort_order = current_brand.sortorder   
    @items = case sort_order
             when 'created_at'
               current_brand.items.active.where(status: true).order(created_at: :desc)
             when 'created_at_asc'
               current_brand.items.active.where(status: true).order(created_at: :asc)
             when 'price_desc'
               current_brand.items.active.where(status: true).order(price: :desc)
             when 'price_asc'
               current_brand.items.active.where(status: true).order(price: :asc)
             when 'name'
               current_brand.items.active.where(status: true).order(name: :asc)
             when 'name_desc'
               current_brand.items.active.where(status: true).order(name: :desc)
             else
               current_brand.items.active.where(status: true).order(created_at: :desc)
             end
  end
end
