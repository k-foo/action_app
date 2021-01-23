class Trouble < ApplicationRecord
  belongs_to :user

  validates :worry, presence: true
end
