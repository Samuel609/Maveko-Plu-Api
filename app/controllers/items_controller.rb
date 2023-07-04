class ItemsController < ApplicationController

  def index
    @items = Item.all
    render json: {data: @items, success: true}
  end

  def show
    @item = Item.find(params[:id])
    render json: {data: @item, success: true}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: {data: @item, success: true}, status: :created
    else
      render json: {data: @item.errors, success: false}, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render json: {data: @item, success: true}, status: :ok
    else
      render json: {data: @item.errors, success: false}, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_code, :decor_code, :item_name, :item_description, :image, :dimensions, :article_group, :tax_class, :weight, :base_unit_id, :target_unit_id)
  end
end
