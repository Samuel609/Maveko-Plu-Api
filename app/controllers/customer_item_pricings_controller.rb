class CustomerItemPricingsController < ApplicationController

  def index
    @customer_item_pricings = CustomerItemPricing.all
    render json: {data: ActiveModelSerializers::SerializableResource.new(@customer_item_pricings, each_serializer: CustomerItemPricingSerializer), status: 200, Success: true}, status: :ok , each_serializer: CustomerItemPricingSerializer
  end

  def filter
    @q = CustomerItemPricing.ransack(params[:q])
    @customer_item_pricings = @q.result(distinct: true)
    
    render json: { data: @customer_item_pricings, status: 200, success: true }, status: :ok
  end
end
