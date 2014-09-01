Given(/^I am on the puppy adoption site$/) do
  visit(HomePage)
end

When(/^I complete the adoption of a puppy$/) do
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout
end

When(/^I checkout leaving the name field blank$/) do
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout('name' => '')
end

When(/^I complete the adoption using a Credit card$/) do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

When(/^I complete the adoption$/) do
  on(CheckoutPage).checkout
end

When(/^I click the View Details button for "(.*?)"$/) do |name|
  on(HomePage).select_puppy(name)
end

When(/^I click the Adopt Me button$/) do
  on(DetailsPage).add_to_cart
end

When(/^I click the Complete the Adoption button$/) do
  on(ShoppingCartPage).proceed_to_checkout
end

When(/^I click the Adopt Another Puppy button$/) do
  on(ShoppingCartPage).continue_shopping
end

When(/^I complete the adoption with:$/) do |table|
  on(CheckoutPage).checkout(table.hashes.first)
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(@current_page.text).to include(message)
end

Then(/^I should see the error message "(.*?)"$/) do |message|
  expect(on(CheckoutPage).error_messages).to include(message)
end

Then(/^I should see "(.*?)" as the name for (line item \d+)$/) do |name, line_item|
  expect(on(ShoppingCartPage).name_for_line_item(line_item)).to include(name)
end

Then(/^I should see "(.*?)" as the subtotal for (line item \d+)$/) do |subtotal, line_item|
  expect(on(ShoppingCartPage).subtotal_for_line_item(line_item)).to include(subtotal)
end

Then(/^I should see "(.*?)" as the cart total$/) do |total|
  expect(on(ShoppingCartPage).cart_total).to eq(total)
end
