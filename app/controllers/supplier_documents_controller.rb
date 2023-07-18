class SupplierDocumentsController < ApplicationController
    include Common

    def show
        @supplier_document_items = SupplierItemRequest.where(supplier_document_id: params[:id])
        render json: {success: true, data: @supplier_document_items}, status: :ok
    end

    def update
        @supplier_document = SupplierDocument.find(params[:id])
        if @supplier_document.effective_date == Date.today
            if @supplier_document.update(model_params)
                if model_params[:status] == 'approved' && @supplier_document.effective_date == Date.today
                    @items_req = SupplierItemRequest.where(supplier_document_id: params[:id])
                    @items_req.each do |item|
                        @tmpPrice = Pricing.find(Item.find_by(item_code: item.item_code).main_item_pricing.pricing_id)
                        @tmpPrice.old_purchase_price = @tmpPrice.new_purchase_price
                        @tmpPrice.new_purchase_price = item.price_per_pc.to_i + 150
                        @tmpPrice.valid_from_new_purchase = Date.today
                        @tmpPrice.save
    
                        @tmpPrice2 = Pricing.find(Item.find_by(item_code: item.item_code).customer_item_pricing.pricing_id)
                        @tmpPrice2.old_retail_price = @tmpPrice2.new_retail_price
                        @tmpPrice2.new_retail_price = (@tmpPrice.new_purchase_price.to_i + 150) * 0.15
                        @tmpPrice2.new_retail_price_valid_from = Date.today
                        @tmpPrice2.save
                    end
                end
                render json: {success: true, data: [@supplier_document, @tmpPrice2]}, status: :ok
            else
                render json: {success: false, data: @supplier_document.errors}, status: :unprocessable_entity
            end
        else
            render json: {success: false, data: 'Document is not effective today'}, status: :unprocessable_entity
        end
    end

    private

    def model_params
        params.require(:payload).permit(:supplier_id, :reference_no, :effective_date, :status)
    end

end
