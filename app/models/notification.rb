class Notification < ApplicationRecord
  UNREAD = "unread".freeze
  READ = "read".freeze

  STATUSES = [UNREAD, READ].freeze

  validates :status, inclusion: { in: STATUSES }
  validates :title, :body, :delivery_date, :status, :sender, presence: true
end
