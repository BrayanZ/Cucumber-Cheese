class CheckoutPage
  include PageObject
  include DataMagic

  DEFAULT_DATA = {
    'name' => Faker::Name.name,
    'address' => Faker::Address.street_address,
    'email' => Faker::Internet.email,
    'pay_type' => 'Purchase order'
  }

  text_field(:name, id: 'order_name')
  text_field(:address, id: 'order_address')
  text_field(:email, id: 'order_email')
  select_list(:pay_type, id: 'order_pay_type')
  button(:place_order, value: 'Place Order')

  def checkout(data = {})
    populate_page_with data_for(:checkout_page, data)
    place_order
  end
end
