class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  with_options presence: true do
    validates :content
    validates :room_id
    validates :user_id
  end
end
