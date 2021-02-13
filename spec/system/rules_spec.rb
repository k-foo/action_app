require 'rails_helper'

def basic_pass
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
end

RSpec.describe "イフゼンルールの設定", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'イフゼンルールの設定ができる時' do
    it '新規投稿後、保存され、習慣カウントページへ遷移するとイフゼンルールが表示される'do
    # basic_passのメソッドを実行
    basic_pass
    # spec/support/log_in_support.rbより、ログインに関するメソッドの呼び出し
    log_in(@user)
    # 習慣ページへ遷移
    visit habits_path
    # 習慣ページには「イフゼンルールの設定」へのリンクがある
    expect(page).to have_content('イフゼンルールの設定')
    # 「イフゼンルールの設定」ボタンをクリックする
    click_link 'イフゼンルールの設定'
    # イフゼンルールのページへ遷移する
    visit rules_path

    end
  end 
  context 'イフゼンルールの設定ができない時' do
    it '新規投稿後、保存できず、入力ページにとどまる'do
    end
  end 
end
