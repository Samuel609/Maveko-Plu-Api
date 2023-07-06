class NotificationsController < ApplicationController
    def create
        @notification = Notification.new(notification_params)
        if @notification.save
            render json: {data: @notification, success: true}, status: :created
        else
            render json: {data: @notification.errors, success: false}, status: :unprocessable_entity
        end
    end

    def fetch
        

    private

    def notification_params
        params.require(:notification).permit(:title, :body, :sender, :status, :delivery_date)
    end
end
