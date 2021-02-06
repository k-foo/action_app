require 'rails_helper'

def basic_pass
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
end

RSpec.describe 'WOOPの法則による目標設定', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @objective = FactoryBot.build(:objective)
  end
  context '目標登録ができるとき' do
    it 'ログインしており、正しい情報を入力すれば目標登録ができて目標一覧ページに移動する' do
     # basic_passのメソッドを実行
      basic_pass
      # spec/support/log_in_support.rbより、ログインに関するメソッドの呼び出し
      log_in(@user)
      # 目標一覧に移動する
      visit objectives_path
      # 目標新規作成ページへ移動する
      visit new_objective_path
      # 目標情報を入力する
      fill_in 'objective_title', with: @objective.title
      select '短期目標', from: 'item-category'
      fill_in 'objective_wish', with: @objective.wish
      fill_in 'objective_outcome', with: @objective.outcome
      fill_in 'objective_obstacle', with: @objective.obstacle
      fill_in 'objective_plan', with: @objective.plan
      # SENDボタンを押すと目標設定のカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Objective.count }.by(1)
      # 目標一覧ページへ遷移する
      expect(current_path).to eq objectives_path
    end
  end
  context '目標設定ができないとき' do
    it '空の情報では目標登録ができずに目標新規作成ページへにとどまる' do
      # spec/support/log_in_support.rbより、ログインに関するメソッドの呼び出し
      log_in(@user)
      # 目標一覧に移動する
      visit objectives_path
      # 目標新規作成ページへ移動する
      visit new_objective_path
      # 目標情報を入力する
      fill_in 'objective_title', with: ''
      fill_in 'objective_wish', with: ''
      fill_in 'objective_outcome', with: ''
      fill_in 'objective_obstacle', with: ''
      fill_in 'objective_plan', with: ''
      # SENDボタンを押しても目標設定のカウントは上がらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Objective.count }.by(0)
      # 目標新規作成ページにとどまることを確認する
      expect(current_path).to eq objectives_path
    end
  end
end
