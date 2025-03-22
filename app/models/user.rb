class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/, message: "は半角英数字を混ぜてください" }


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー]+\z/, message: "はカタカナで入力してください" } do
    validates :first_name_kana
    validates :last_name_kana
  end

end
