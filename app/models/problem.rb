class Problem < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :title
    validates :text
  end
end
