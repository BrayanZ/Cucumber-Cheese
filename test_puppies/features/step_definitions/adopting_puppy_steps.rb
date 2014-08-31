def row_for(line_item)
  (line_item - 1) * 6
end

Given(/^I am on the puppy adoption site$/) do
  @browser.goto 'http://puppies.herokuapp.com'
end

When(/^I click the first View Details button$/) do
  @browser.button(value: 'View Details', index: 0).click
end

When(/^I click the second View Details button$/) do
  @browser.button(value: 'View Details', index: 1).click
end

When(/^I click the Adopt Me button$/) do
  @browser.button(value: 'Adopt Me!').click
  @shopping_cart = ShoppingCartPage.new(@browser)
end

When(/^I click the Complete the Adoption button$/) do
  @shopping_cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

When(/^I click the Adopt Another Puppy button$/) do
  @shopping_cart.continue_shopping
end

When(/^I enter "(.*?)" in the name field$/) do |name|
  @checkout.name = name
end

When(/^I enter "(.*?)" in the address field$/) do |address|
  @checkout.address = address
end

When(/^I enter "(.*?)" in the email field$/) do |email|
  @checkout.email = email
end

When(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
  @checkout.pay_type = pay_type
end

When(/^I click the Place Order button$/) do
  @checkout.place_order
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(@browser.text).to include(message)
end

Then(/^I should see "(.*?)" as the name for line item (\d+)$/) do |name, line_item|
  expect(@shopping_cart.name_for_line_item(line_item.to_i)).to include(name)
end

Then(/^I should see "(.*?)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  expect(@shopping_cart.subtotal_for_line_item(line_item.to_i)).to include(subtotal)
end

Then(/^I should see "(.*?)" as the cart total$/) do |total|
  expect(@shopping_cart.cart_total).to eq(total)
end
