class Trouble < ApplicationRecord
  belongs_to :user
  enum message_type: { trouble: 0, encouragement: 1 }
  validates :worry, presence: true
end
