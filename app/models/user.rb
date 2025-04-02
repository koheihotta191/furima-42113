class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/, message: "は半角英数字を混ぜてください" }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "は@を含む正しい形式で入力してください" }


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "はカタカナで入力してください" } do
    validates :first_name_kana
    validates :last_name_kana
  end

  has_many :items
  has_many :purchases

end
