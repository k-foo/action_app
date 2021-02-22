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
      it '「食事」のイフルールが20文字以内の場合には登録できる' do
        @rule.if_1 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「食事」のゼンルールが20文字以内の場合には登録できる' do
        @rule.then_1 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「睡眠」のイフルールが20文字以内の場合には登録できる' do
        @rule.if_2 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「睡眠」のゼンルールが20文字以内の場合には登録できる' do
        @rule.then_2 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「運動」のイフルールが20文字以内の場合には登録できる' do
        @rule.if_3 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「運動」のゼンルールが20文字以内の場合には登録できる' do
        @rule.then_3 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「学び」のイフルールが20文字以内の場合には登録できる' do
        @rule.if_4 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「学び」のゼンルールが20文字以内の場合には登録できる' do
        @rule.then_4 = '〇〇する'
        expect(@rule).to be_valid
      end
      it '「マインド」のイフルールが20文字以内の場合には登録できる' do
        @rule.if_5 = '夕食後に'
        expect(@rule).to be_valid
      end
      it '「マインド」のゼンルールが20文字以内の場合には登録できる' do
        @rule.then_5 = '〇〇する'
        expect(@rule).to be_valid
      end
    end

    context 'イフゼンルールの保存ができないとき' do
      it '「食事」のイフルールが21文字以上の場合には保存できない' do
        @rule.if_1 = '21文字以上のイフルールを設定 〇〇したら'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「食事に関するイフルール」は20文字以内で入力してください')
      end
      it '「食事」のゼンルールが21文字以上の場合には保存できない' do
        @rule.then_1 = '21文字以上のゼンルールを設定 〇〇〇〇する'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「食事に関するゼンルール」は20文字以内で入力してください')
      end
      it '「睡眠」のイフルールが21文字以上の場合には保存できない' do
        @rule.if_2 = '21文字以上のイフルールを設定 〇〇したら'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「睡眠に関するイフルール」は20文字以内で入力してください')
      end
      it '「睡眠」のゼンルールが21文字以上の場合には保存できない' do
        @rule.then_2 = '21文字以上のゼンルールを設定 〇〇〇〇する'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「睡眠に関するゼンルール」は20文字以内で入力してください')
      end
      it '「運動」のイフルールが21文字以上の場合には保存できない' do
        @rule.if_3 = '21文字以上のイフルールを設定 〇〇したら'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「運動に関するイフルール」は20文字以内で入力してください')
      end
      it '「運動」のゼンルールが21文字以上の場合には保存できない' do
        @rule.then_3 = '21文字以上のゼンルールを設定 〇〇〇〇する'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「運動に関するゼンルール」は20文字以内で入力してください')
      end
      it '「学び」のイフルールが21文字以上の場合には保存できない' do
        @rule.if_4 = '21文字以上のイフルールを設定 〇〇したら'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「学びに関するイフルール」は20文字以内で入力してください')
      end
      it '「学び」のゼンルールが21文字以上の場合には保存できない' do
        @rule.then_4 = '21文字以上のゼンルールを設定 〇〇〇〇する'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「学びに関するゼンルール」は20文字以内で入力してください')
      end
      it '「マインド」のイフルールが21文字以上の場合には保存できない' do
        @rule.if_5 = '21文字以上のイフルールを設定 〇〇したら'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「マインドに関するイフルール」は20文字以内で入力してください')
      end
      it '「マインド」のゼンルールが21文字以上の場合には保存できない' do
        @rule.then_5 = '21文字以上のゼンルールを設定 〇〇〇〇する'
        @rule.valid?
        expect(@rule.errors.full_messages).to include('「マインドに関するゼンルール」は20文字以内で入力してください')
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
