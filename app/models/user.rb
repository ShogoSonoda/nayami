class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :problems
  has_many :answers

  has_many :room_users
  has_many :rooms, through: :room_users

  has_many :messages

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_one :profile

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  validates :name, presence: true
end
