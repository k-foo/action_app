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
  context 'イフゼンルールの設定ができる場合' do
    it '新規投稿後、保存され、習慣カウントページへ遷移するとイフゼンルールが表示される' do
      # basic_passのメソッドを実行
      basic_pass
      # spec/support/log_in_support.rbより、ログインに関するメソッドの呼び出し
      log_in(@user)
      # ログイン後、イフゼンルールの設定ページへ遷移
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
      # 保存ボタンをクリックする
      click_on '保存'
      # 保存ボタンを押すとイフゼンルール設定のカウントが1上がることを確認する
      expect(Rule.count).to eq 1
      # 保存後は、習慣カウントページへ遷移する
      expect(current_path).to eq habits_path
      # 保存されたイフゼンルールが表示されていることを確認する
      expect(page).to have_content '食事のイフルール'
      expect(page).to have_content '食事のゼンルール'
      expect(page).to have_content '睡眠のイフルール'
      expect(page).to have_content '睡眠のゼンルール'
      expect(page).to have_content '運動のイフルール'
      expect(page).to have_content '運動のゼンルール'
      expect(page).to have_content '学びのイフルール'
      expect(page).to have_content '学びのゼンルール'
      expect(page).to have_content 'マインドのイフルール'
      expect(page).to have_content 'マインドのゼンルール'
    end
  end
  context 'イフゼンルールの設定ができない場合' do
    it '新規投稿後、保存できず、入力ページにとどまる' do
      # basic_passのメソッドを実行
      basic_pass
      # spec/support/log_in_support.rbより、ログインに関するメソッドの呼び出し
      log_in(@user)
      # ログイン後、イフゼンルールの設定ページへ遷移
      visit rules_path
      # フォームにそれぞれ入力する(一部、nilで入力)
      fill_in 'rule_if_1', with: nil
      fill_in 'rule_then_1', with: '食事のゼンルール、21文字以上の設定 〇〇〇〇する'
      fill_in 'rule_if_2', with: '睡眠のイフルール、21文字以上の設定 〇〇したら'
      fill_in 'rule_then_2', with: '睡眠のゼンルール、21文字以上の設定 〇〇〇〇する'
      fill_in 'rule_if_3', with: '運動のイフルール、21文字以上の設定 〇〇したら'
      fill_in 'rule_then_3', with: '運動のゼンルール、21文字以上の設定 〇〇〇〇する'
      fill_in 'rule_if_4', with: '学びのイフルール、21文字以上の設定 〇〇したら'
      fill_in 'rule_then_4', with: '学びのゼンルール、21文字以上の設定 〇〇〇〇する'
      fill_in 'rule_if_5', with: 'マインドのイフルール、21文字以上の設定 〇〇したら'
      fill_in 'rule_then_5', with: 'マインドのゼンルール、21文字以上の設定 〇〇〇〇する'
      # 保存ボタンをクリックする
      click_on '保存'
      # 保存ボタンを押してもイフゼンルール設定のカウントが上がらないことを確認する
      expect(Rule.count).to eq 0
      # イフゼンルールのページに留まっていることを確認する
      expect(current_path).to eq rules_path
    end
  end
end
