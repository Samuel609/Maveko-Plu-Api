class NotifcationService
  def initialize(type, user)
    @type = type
    @user = user
  end

  def send_update_notification(user_id)
    Notification.create(title: "Price List Update", body: "Price List has been updated, please review the changes and approve or reject", 
                        sender: "Price List Management Team", status: Notification::UNREAD, user_id: user_id, delivery_date: Date.today)
  end

  def send_approval_notification(user_id)
    Notification.create(title: "Price List Approval", body: "Price List update has been approved",
                        sender: "Price List Management Team", status: Notification::UNREAD, user_id: user_id, delivery_date: Date.today)
  end

  def send_reject_notification(user_id)
    Notification.create(title: "Price List Rejection", body: "Price List update has been rejected",
                        sender: "Price List Management Team", status: Notification::UNREAD, user_id: user_id, delivery_date: Date.today)
  end

  def call
    if @type == "update"
      send_update_notification(@user.id)
    elsif @type == "approve"
      send_approval_notification(@user.id)
    elsif @type == "reject"
      send_reject_notification(@user.id)
    end
  end


end