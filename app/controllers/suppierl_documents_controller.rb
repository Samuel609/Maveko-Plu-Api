class SuppierlDocumentsController < ApplicationController
    include Common

    private

    def supplier_document_params
        params.require(:payload).permit(:supplier_id, :document_id)
    end

end
