require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end
    it 'furigana_first_nameが空では登録できない' do
      @user.furigana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana_first_name can't be blank")
    end
    it 'furigana_last_nameが空では登録できない' do
      @user.furigana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana_last_name can't be blank")
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth_date can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英語のみでは登録できない' do
    end
    it 'passwordが全角では登録できない' do
    end
    it 'first_nameが半角では登録できない' do
    end
    it 'last_nameが半角では登録できない' do
    end
    it 'first_nameが英語では登録できない' do
    end
    it 'last_nameが英語では登録できない' do
    end
    it 'furigana_first_nameが半角では登録できない' do
    end
    it 'furigana_last_nameが半角では登録できない' do
    end
    it 'furigana_first_nameがひらがなでは登録できない' do
    end
    it 'furigana_last_nameがひらがなでは登録できない' do
    end
    it 'furigana_first_nameが漢字では登録できない' do
    end
    it 'furigana_last_nameが漢字では登録できない' do
    end
    it 'furigana_first_nameが英語では登録できない' do
    end
    it 'furigana_last_nameが英語では登録できない' do
    end
  end
end