require 'rubygems'
require 'watir-webdriver'

def go_to_the_adoption_site
  @browser = Watir::Browser.new :firefox
  @browser.goto 'http://puppies.herokuapp.com'
end

def adopt_puppy_number(number)
  @browser.button(value: 'View Details', index: number).click
  @browser.button(value: 'Adopt Me!').click
end

def adopt_another_puppy
  @browser.button(value: 'Adopt Another Puppy').click
end

def checkout_with(name, address, email, pay_type)
  @browser.button(value: 'Complete the Adoption').click
  @browser.text_field(id: 'order_name').set(name)
  @browser.text_field(id: 'order_address').set(address)
  @browser.text_field(id: 'order_email').set(email)
  @browser.select_list(id: 'order_pay_type').select(pay_type)
  @browser.button(value: 'Place Order').click
end

def verify_page_contains(message)
  fail 'Browser text did not match expected value' unless @browser.text.include? message
end

def close_browser
  @browser.close
end

go_to_the_adoption_site
adopt_puppy_number 0
adopt_another_puppy
adopt_puppy_number 1
checkout_with('Cheezy', '123 Main St.', 'cheezy@foo.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!'
close_browser
