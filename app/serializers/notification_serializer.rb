class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :sender, :status, :delivery_date
end
