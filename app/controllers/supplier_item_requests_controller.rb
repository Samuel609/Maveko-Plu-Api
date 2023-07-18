class SupplierItemRequestsController < ApplicationController
  include Common
  

  def model_params()
    params.require(:payload).permit(:item_code, :item_description, :dimensions, :price_per_pc, :base_unit, :target_unit, :currency, :supplier_document_id)
  end
end
