class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :industry

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

  validates :name, presence: true
  validates :industry_id, numericality: { other_than: 1 }

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
