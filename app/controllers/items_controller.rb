class ItemsController < ApplicationController
  include Common

  private

  def model_params
    params.require(:payload).permit(:item_code, :decor_code, :item_name, :item_description, :image, :dimension_id,
                                    :article_group, :tax_class, :weight, :base_unit_id, :target_unit_id, :supplier_item_pricing_id, :main_item_pricing_id, :customer_item_pricing_id)
  end
end
