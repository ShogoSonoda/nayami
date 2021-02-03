class Room < ApplicationRecord
  has_many :room_users

  def room_user_by?(user)
    room_users.where(user_id: user.id).exists?
  end

  has_many :messages

  validates :name, presence: true
end
