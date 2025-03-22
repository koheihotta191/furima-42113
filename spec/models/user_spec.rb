require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it '全ての項目が正しく入力されている場合、登録できること' do
      user = User.new(
        nickname: '山田太郎ものがたり',
        email: 'name@gmail.com',
        password: '6SSZert',
        password_confirmation: '6SSZert',
        first_name: '山田',
        last_name: '太郎',
        first_name_kana: 'ヤマダ',
        last_name_kana: 'タロウ',
        birth_date: '2000-01-01'
      )
      expect(user).to be_valid
    end
  end
end
