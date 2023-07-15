class NotificationsController < ApplicationController
    def show
        @notifications = Notification.where(user_id: params[:id], status: Notification::UNREAD).where("delivery_date <= ?", Date.today)
        render json: {data: @notifications, success: true}, status: :ok
    end
end
