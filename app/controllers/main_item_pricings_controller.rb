class MainItemPricingsController < ApplicationController
  def index
    @main_item_pricings = MainItemPricing.all
    render json: {data: ActiveModelSerializers::SerializableResource.new(@main_item_pricings, each_serializer: MainItemPricingSerializer), status: 200, Success: true}, status: :ok
  end

  def filter
    @q = MainItemPricing.ransack(params[:q])
    @main_item_pricings = @q.result(distinct: true)
    
    render json: { data: @main_item_pricings, status: 200, success: true }, status: :ok
  end
end
