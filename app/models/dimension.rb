class Dimension < ApplicationRecord
    validates :length, :width, :height, presence: true
    validates :length, :width, :height, numericality:{ greater_than: 0 }

end
