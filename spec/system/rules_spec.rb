require 'rails_helper'

RSpec.describe "イフゼンルールの設定", type: :system do
  before do
    driven_by(:rack_test)
  end
  context 'イフゼンルールの設定ができる時' do
    it '新規投稿後、保存され、習慣カウントページへ遷移するとイフゼンルールが表示される'do
    end
  end 
  context 'イフゼンルールの設定ができない時' do
    it '新規投稿後、保存できず、入力ページにとどまる'do
    end
  end 
end
