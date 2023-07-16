class SupplierDocumentsController < ApplicationController
    include Common

    def show
        @supplier_document_items = SupplierItemRequest.where(supplier_document_id: params[:id])
        render json: {success: true, data: @supplier_document_items}, status: :ok
    end

    private

    def model_params
        params.require(:payload).permit(:supplier_id, :reference_no)
    end

end
