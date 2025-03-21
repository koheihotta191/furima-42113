class Address < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :purchase, presence: true
  validates :postal_code, presence: true
  validates :shipping_area_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true



  belongs_to :purchase
  
end
