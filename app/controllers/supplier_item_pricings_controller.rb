class SupplierItemPricingsController < ApplicationController
  def index
    @supplier_item_pricings = SupplierItemPricing.all
    render json: {data: ActiveModelSerializers::SerializableResource.new(@supplier_item_pricings, each_serializer: SupplierItemPricingSerializer), status: 200, Success: true}, status: :ok
  end

  def create
    @supplier_item_pricing = SupplierItemPricing.new(supplier_item_pricing_params)
    if @supplier_item_pricing.save
      render json: {data: @supplier_item_pricing, status: 200, Success: true}, status: :created
    else
      render json: {data: @supplier_item_pricing.errors, status: 400, Success: false}, status: :unprocessable_entity
    end
  end

  def update
    @supplier_item_pricing = SupplierItemPricing.find(params[:id])
    @pricing = Pricing.find(@supplier_item_pricing.pricing_id)
    @pricing.old_purchase_price = @pricing.new_purchase_price
    if @pricing.update(supplier_item_pricing_params)
      @main = MainItemPricing.find_by(item_id: @supplier_item_pricing.item_id)
      @pricing2 = Pricing.find(@main.pricing_id)
      @pricing2.old_purchase_price = @pricing2.new_purchase_price
      @pricing2.new_purchase_price = (@pricing.new_purchase_price + 100)
      if @pricing2.save
        @cust = CustomerItemPricing.find_by(item_id: @supplier_item_pricing.item_id)
        @pricing3 = Pricing.find(@cust.pricing_id)
        @pricing3.old_retail_price = @pricing3.new_retail_price
        @pricing3.new_retail_price = (@pricing2.new_purchase_price - (@pricing2.new_purchase_price * 0.3))
        @pricing3.save
      end
      render json: {data: ActiveModelSerializers::SerializableResource.new(@supplier_item_pricing, serializer: SupplierItemPricingSerializer), status: 200, Success: true}, status: :ok
    else
      render json: {data: @supplier_item_pricing.errors, status: 400, Success: false}, status: :unprocessable_entity
    end
  end

  def filter
    @q = SupplierItemPricing.ransack(params[:q])
    @supplier_item_pricings = @q.result(distinct: true)
    
    render json: { data: @supplier_item_pricings, status: 200, success: true }, status: :ok
  end

  private

  def supplier_item_pricing_params
    params.require(:sip).permit(:id, :new_purchase_price)
  end
end
