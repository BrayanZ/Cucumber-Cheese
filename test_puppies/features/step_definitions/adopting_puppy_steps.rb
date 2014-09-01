Given(/^I am on the puppy adoption site$/) do
  visit(HomePage)
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
  on(CheckoutPage).checkout_with(table.hashes.first)
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(@browser.text).to include(message)
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
