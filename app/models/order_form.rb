class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :purchase, :postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include a hyphen (e.g. 123-4567)" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :token, presence: true

    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Address.create(
      postal_code: postal_code,
      shipping_area_id: shipping_area_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end
