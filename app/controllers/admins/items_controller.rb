class Admins::ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new
    @item_form.assign_attributes(item_form_params)

    unless @item_form.valid?
      render :new, status: :unprocessable_entity
      return
    end

    if @item_form.save
      redirect_to admins_items_path, notice: "商品が正常に作成されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item_form = ItemForm.new(@item)
  end

  def update
    @item_form = ItemForm.new(@item)
    @item_form.assign_attributes(item_form_params)

    unless @item_form.valid?
      render :edit, status: :unprocessable_entity
      return
    end

    if @item_form.update
      redirect_to admins_item_path(@item), notice: "商品が正常に更新されました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.soft_delete
    redirect_to admins_items_path, notice: "商品が正常に削除されました。"
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_form_params
    params.require(:item).permit(:name, :price, :description, :published, :image)
  end
end
