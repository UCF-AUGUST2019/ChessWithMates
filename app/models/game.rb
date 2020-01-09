class Game < ApplicationRecord
  scope :available, -> { where(black_id: nil) }
  belongs_to :user, required: false
  has_many :pieces

end