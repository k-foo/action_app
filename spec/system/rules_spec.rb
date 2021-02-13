require 'rails_helper'

def basic_pass
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
end

RSpec.describe 'イフゼンルールの設定', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'イフゼンルールの設定ができる時' do
    it '新規投稿後、保存され、習慣カウントページへ遷移するとイフゼンルールが表示される' do
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
      # フォームにそれぞれ入力する
      fill_in 'rule_if_1', with: '食事のイフルール'
      fill_in 'rule_then_1', with: '食事のゼンルール'
      fill_in 'rule_if_2', with: '睡眠のイフルール'
      fill_in 'rule_then_2', with: '睡眠のゼンルール'
      fill_in 'rule_if_3', with: '運動のイフルール'
      fill_in 'rule_then_3', with: '運動のゼンルール'
      fill_in 'rule_if_4', with: '学びのイフルール'
      fill_in 'rule_then_4', with: '学びのゼンルール'
      fill_in 'rule_if_5', with: 'マインドのイフルール'
      fill_in 'rule_then_5', with: 'マインドのゼンルール'
      # 保存ボタンを押すとイフゼンルール設定のカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Rule.count }.by(1)
      # 目標一覧ページへ遷移する
    end
  end
  context 'イフゼンルールの設定ができない時' do
    it '新規投稿後、保存できず、入力ページにとどまる' do
    end
  end
end
