class Purchase < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  validates :item, presence: true
  validates :user, presence: true





  belongs_to :user
  belongs_to :item
  has_one :address
  
end
