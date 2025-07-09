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

    # バリデーションチェック
    unless @item_form.valid?
      render :new, status: :unprocessable_entity
      return
    end

    # バリデーション成功時の保存処理
    if @item_form.save
      redirect_to admins_items_path, notice: "\u30A2\u30A4\u30C6\u30E0\u304C\u6B63\u5E38\u306B\u4F5C\u6210\u3055\u308C\u307E\u3057\u305F\u3002"
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

    # バリデーションチェック
    unless @item_form.valid?
      render :edit, status: :unprocessable_entity
      return
    end

    # バリデーション成功時の更新処理
    if @item_form.update
      redirect_to admins_item_path(@item), notice: "\u30A2\u30A4\u30C6\u30E0\u304C\u6B63\u5E38\u306B\u66F4\u65B0\u3055\u308C\u307E\u3057\u305F\u3002"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to admins_items_path, notice: "\u30A2\u30A4\u30C6\u30E0\u304C\u6B63\u5E38\u306B\u524A\u9664\u3055\u308C\u307E\u3057\u305F\u3002"
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_form_params
    params.require(:item).permit(:name, :price, :description, :published, :image)
  end
end
