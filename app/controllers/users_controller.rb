class UsersController < ApplicationController
    include Common

    private

    def model_params
        params.require(:payload).permit(:email, :password, :password_confirmation)
    end
end
