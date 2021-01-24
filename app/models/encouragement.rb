class Encouragement < ApplicationRecord
  belongs_to :user
  belongs_to :trouble

  validates :encouragement, presence: true
end
