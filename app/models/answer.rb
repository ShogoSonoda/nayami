class Answer < ApplicationRecord
  belongs_to :problem
  belongs_to :user

  validates :text, presence: true
end
