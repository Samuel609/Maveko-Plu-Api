class CrossReferencesController < ApplicationController
    include Common

    private
    def model_params
        params.require(:payload).permit(:item_description, :supplier_id, :maveko_id, :customer_id)
    end    
end
