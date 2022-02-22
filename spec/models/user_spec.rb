require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end


    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end

      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空だと保存できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      
      it 'last_nameが全角日本語でないと保存できないこと' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'kana_firstnameが空だと保存できないこと' do
        @user.kana_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana firstname can't be blank")
      end

      it 'kana_lastnameが空だと保存できないこと' do
        @user.kana_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana lastname can't be blank")
      end

      it 'kana_firstnameが全角カタカナでないと保存できないこと' do
        @user.kana_firstname = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana firstname is invalid')
      end

      it 'kana_lastnameが全角カタカナでないと保存できないこと' do
        @user.kana_lastname = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana lastname is invalid')
      end

      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


      it 'emailが空では登録できない' do
        @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Email can't be blank")
      end


      
      it '重複したemailが存在する場合は登録できない' do
        first_user = FactoryBot.create(:user, email: 'test@test.co.jp')
        second_user = FactoryBot.build(:user, email: 'test@test.co.jp')
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'textmail'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")

      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

  end

end
