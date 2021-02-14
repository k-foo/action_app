class Habit < ApplicationRecord
  belongs_to :user
  has_one :rule
end
