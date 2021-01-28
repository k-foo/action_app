class Trouble < ApplicationRecord
  belongs_to :user
  has_many   :encouragements

  validates :worry, presence: true
end
