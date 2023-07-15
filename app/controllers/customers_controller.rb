class CustomersController < ApplicationController
    include Common

    private
    def model_params
        params.require(:payload).permit(:name, :user_id)
    end
end


