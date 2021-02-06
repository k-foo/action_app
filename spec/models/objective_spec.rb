require 'rails_helper'
RSpec.describe Objective, type: :model do
  before do
    @objective = FactoryBot.create(:objective)
  end

  describe 'WOOPの法則を浸かった目標の設定' do
    context '目標設定ができるとき' do
      it '全ての入力事項を、入力していると登録できる' do
        expect(@objective).to be_valid
      end
      it 'タイトルを入力していれば登録できる' do
        @objective.title = '今年の目標'
        expect(@objective).to be_valid
      end
      it 'カテゴリーが選択されていれば登録できる' do
        @objective.category_id = 1
        expect(@objective).to be_valid
      end
      it '「願望」部分を入力していれば登録できる' do
        @objective.wish = '今年の目標'
        expect(@objective).to be_valid
      end
      it '「結果」部分を入力していれば登録できる' do
        @objective.outcome = '今年の目標'
        expect(@objective).to be_valid
      end
      it '「障害」部分を入力していれば登録できる' do
        @objective.obstacle = '今年の目標'
        expect(@objective).to be_valid
      end
      it '「計画」部分を入力していれば登録できる' do
        @objective.plan = '今年の目標'
        expect(@objective).to be_valid
      end
    end

    context '目標設定ができないとき' do
      it 'タイトルが空欄だと登録できない' do
        @objective.title = nil
        @objective.valid?
        expect(@objective.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'カテゴリーの情報が空欄だと登録できない' do
        @objective.category_id = nil
        @objective.valid?
        expect(@objective.errors.full_messages).to include('目標の期間設定を入力してください')
      end
      it '「願望」部分が空欄だと登録できない' do
        @objective.wish = nil
        @objective.valid?
        expect(@objective.errors.full_messages).to include('「願望」を入力してください')
      end
      it '「結果」部分が空欄だと登録できない' do
        @objective.outcome = nil
        @objective.valid?
        expect(@objective.errors.full_messages).to include('「結果」を入力してください')
      end
      it '「障害」部分が空欄だと登録できない' do
        @objective.obstacle = nil
        @objective.valid?
        expect(@objective.errors.full_messages).to include('「障害」を入力してください')
      end
      it '「計画」部分が空欄だと登録できない' do
        @objective.plan = nil
        @objective.valid?
        expect(@objective.errors.full_messages).to include('「計画」を入力してください')
      end
    end
  end
end
