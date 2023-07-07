class NotificationsController < ApplicationController
    def create
        @notification = Notification.new(notification_params)
        if @notification.save
            render json: {data: @notification, success: true}, status: :created
        else
            render json: {data: @notification.errors, success: false}, status: :unprocessable_entity
        end
    end

    # fetch notifications with date today or less than today not after today
    def show
        @notifications = Notification.where(user_id: params[:id], status: Notification::UNREAD).where("delivery_date <= ?", Date.today)
        render json: {data: @notifications, success: true}, status: :ok
    end

    private

    def notification_params
        params.require(:notification).permit(:title, :body, :sender, :status, :delivery_date)
    end
end
