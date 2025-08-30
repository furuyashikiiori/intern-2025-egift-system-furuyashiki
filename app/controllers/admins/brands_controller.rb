class Admins::BrandsController < ApplicationController
  before_action :set_brand, only: [ :edit, :update ]

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to admins_items_path, notice: "商品の表示順を更新しました。"
    else
      render :edit
    end
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :sortorder)
  end
end