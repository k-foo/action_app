class Objective < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category

  with_options presence: true do
    validates :title
    validates :category_id
    validates :wish
    validates :outcome
    validates :obstacle
    validates :plan
  end
end
