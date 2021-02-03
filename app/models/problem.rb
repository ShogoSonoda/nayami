class Problem < ApplicationRecord
  belongs_to :user
  has_many :answers

  with_options presence: true do
    validates :title
    validates :text
  end
end
