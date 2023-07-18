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

  def selling_price_calculated(user_id)
    Notification.create(title: " selling price calculated", body: "selling price has been calculated ",
                        sender: "price List Management Team", status: Notification::UNREAD, user_id: user_id, delivery_date: Date.today)
  end

  def selling_price_approved(user_id)
    Notification.create(title: "selling price approved", body: "selling price has been approved",
                        sender: "price List Management Team", status: Notification::UNREAD, user_id: user_id, delivery_date: Date.today)
  end

  def Master_pricelist_updated(user_id)
    Notification.create(title: "selling price approved", body: "selling price has been approved",
                        sender: "price List Management Team", status: Notification::UNREAD, user_id: user_id, delivery_date: Date.today)
  end


  def call
    if @type == "update"
      send_update_notification(@user.id)
    elsif @type == "approve"
      send_approval_notification(@user.id)
    elsif @type == "reject"
      send_reject_notification(@user.id)
    elsif @type == "selling_price_calculated"
      selling_price_calculated(@user.id)
    elsif @type == "selling_price_approved"
      selling_price_calculated(@user.id)
    end
  end

end