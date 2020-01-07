class Game < ApplicationRecord
  scope :available, -> { where(black_id: nil) }
  belongs_to :user, required: false
  has_many :pieces

  def white_user_name
    User.find_by(:id white_id).user_id
  end
end