require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it '全ての項目が正しく入力されている場合、登録できること' do
      user = User.new(
        nickname: '山田太郎ものがたり',
        email: 'name@gmail.com',
        password: '6ssert',
        password_confirmation: '6ssert',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      expect(user).to be_valid
    end
  end

  describe 'ユーザー新規登録（異常系）' do
    it 'nicknameが空では登録できないこと' do
      user = User.new(
        nickname: '',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: '',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordとpassword_confirmationが一致しない場合は登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: 'incorrectpassword',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '山田',
        last_name: '',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_name_kanaが空では登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: '',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが空では登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: '',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'birth_dateが空では登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: ''
      )
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'passwordが英数字を混ぜていないと登録できないこと' do
      user = User.new(
        nickname: '山田太郎',
        email: 'name@gmail.com',
        password: 'password',  # 半角英数字混合でない
        password_confirmation: 'password',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英数字を混ぜてください")
    end
  end
end
