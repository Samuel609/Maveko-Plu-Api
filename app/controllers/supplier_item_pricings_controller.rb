class SupplierItemPricingsController < ApplicationController
  def index
    @supplier_item_pricings = SupplierItemPricing.all
    render json: {data: @supplier_item_pricings, status: 200, Success: true}, status: :ok
  end

  def filter
    @q = SupplierItemPricing.ransack(params[:q])
    @supplier_item_pricings = @q.result(distinct: true)
    
    render json: { data: @supplier_item_pricings, status: 200, success: true }, status: :ok
  end
end
