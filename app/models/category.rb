class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '短期目標' },
    { id: 2, name: '中期目標' },
    { id: 3, name: '長期目標' },
    { id: 4, name: '指定なし' }
  ]
  include ActiveHash::Associations
  has_many :objectives
end
