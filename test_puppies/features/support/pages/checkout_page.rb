class CheckoutPage
  def initialize(browser)
    @browser = browser
  end

  def name=(a_name)
    @browser.text_field(id: 'order_name').set(a_name)
  end

  def address=(an_address)
    @browser.text_field(id: 'order_address').set(an_address)
  end

  def email=(an_email)
    @browser.text_field(id: 'order_email').set(an_email)
  end

  def pay_type=(a_pay_type)
    @browser.select_list(id: 'order_pay_type').select(a_pay_type)
  end

  def place_order
    @browser.button(value: 'Place Order').click
  end
end
