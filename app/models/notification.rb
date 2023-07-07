class Notification < ApplicationRecord
  UNREAD = "unread".freeze
  READ = "read".freeze

  STATUSES = [UNREAD, READ].freeze

  validates :status, inclusion: { in: STATUSES }
end
