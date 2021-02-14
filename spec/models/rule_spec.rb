require 'rails_helper'
RSpec.describe Rule, type: :model do
  before do
    @rule = FactoryBot.create(:rule)
  end

  describe 'イフゼンルールの登録' do
    context 'イフゼンルールの保存ができるとき' do
      it '全ての入力事項を、入力していると登録できる' do
        expect(@rule).to be_valid
      end
      it '「食事」のイフルールが12文字以内の場合には登録できる' do
        @rule.if_1 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「食事」のゼンルールが12文字以内の場合には登録できる' do
        @rule.then_1 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「睡眠」のイフルールが12文字以内の場合には登録できる' do
        @rule.if_2 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「睡眠」のゼンルールが12文字以内の場合には登録できる' do
        @rule.then_2 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「運動」のイフルールが12文字以内の場合には登録できる' do
        @rule.if_3 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「運動」のゼンルールが12文字以内の場合には登録できる' do
        @rule.then_3 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「学び」のイフルールが12文字以内の場合には登録できる' do
        @rule.if_4 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「学び」のゼンルールが12文字以内の場合には登録できる' do
        @rule.then_4 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「マインド」のイフルールが12文字以内の場合には登録できる' do
        @rule.if_5 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「マインド」のゼンルールが12文字以内の場合には登録できる' do
        @rule.then_5 = '〇〇する'
        expect(@rule).to be_valid
      end
    end

    context 'イフゼンルールの保存ができないとき' do
      it '「食事」のイフルールが13文字以上の場合には保存できない' do
        @rule.if_1 = '１３文字以上のイフルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「食事に関するイフルール」は12文字以内で入力してください')
      end
      it '「食事」のゼンルールが13文字以上の場合には保存できない' do
        @rule.then_1 = '１３文字以上のゼンルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「食事に関するゼンルール」は12文字以内で入力してください')
      end
      it '「睡眠」のイフルールが13文字以上の場合には保存できない' do
        @rule.if_2 = '１３文字以上のイフルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「睡眠に関するイフルール」は12文字以内で入力してください')
      end
      it '「睡眠」のゼンルールが13文字以上の場合には保存できない' do
        @rule.then_2 = '１３文字以上のゼンルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「睡眠に関するゼンルール」は12文字以内で入力してください')
      end
      it '「運動」のイフルールが13文字以上の場合には保存できない' do
        @rule.if_3 = '１３文字以上のイフルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「運動に関するイフルール」は12文字以内で入力してください')
      end
      it '「運動」のゼンルールが13文字以上の場合には保存できない' do
        @rule.then_3 = '１３文字以上のゼンルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「運動に関するゼンルール」は12文字以内で入力してください')
      end
      it '「学び」のイフルールが13文字以上の場合には保存できない' do
        @rule.if_4 = '１３文字以上のイフルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「学びに関するイフルール」は12文字以内で入力してください')
      end
      it '「学び」のゼンルールが13文字以上の場合には保存できない' do
        @rule.then_4 = '１３文字以上のゼンルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「学びに関するゼンルール」は12文字以内で入力してください')
      end
      it '「マインド」のイフルールが13文字以上の場合には保存できない' do
        @rule.if_5 = '１３文字以上のイフルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「マインドに関するイフルール」は12文字以内で入力してください')
      end
      it '「マインド」のゼンルールが13文字以上の場合には保存できない' do
        @rule.then_5 = '１３文字以上のゼンルールを設定'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「マインドに関するゼンルール」は12文字以内で入力してください')
      end

      it '「食事」のイフルールが空の場合には保存できない' do
        @rule.if_1 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「食事に関するイフルール」を入力してください')
      end
      it '「食事」のゼンルールが空の場合には保存できない' do
        @rule.then_1 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「食事に関するゼンルール」を入力してください')
      end
      it '「睡眠」のイフルールが空の場合には保存できない' do
        @rule.if_2 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「睡眠に関するイフルール」を入力してください')
      end
      it '「睡眠」のゼンルールが空の場合には保存できない' do
        @rule.then_2 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「睡眠に関するゼンルール」を入力してください')
      end
      it '「運動」のイフルールが空の場合には保存できない' do
        @rule.if_3 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「運動に関するイフルール」を入力してください')
      end
      it '「運動」のゼンルールが空の場合には保存できない' do
        @rule.then_3 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「運動に関するゼンルール」を入力してください')
      end
      it '「学び」のイフルールが空の場合には保存できない' do
        @rule.if_4 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「学びに関するイフルール」を入力してください')
      end
      it '「学び」のゼンルールが空の場合には保存できない' do
        @rule.then_4 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「学びに関するゼンルール」を入力してください')
      end
      it '「マインド」のイフルールが空の場合には保存できない' do
        @rule.if_5 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「マインドに関するイフルール」を入力してください')
      end
      it '「マインド」のゼンルールが空の場合には保存できない' do
        @rule.then_5 = nil
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「マインドに関するゼンルール」を入力してください')
      end
    end
  end
end
