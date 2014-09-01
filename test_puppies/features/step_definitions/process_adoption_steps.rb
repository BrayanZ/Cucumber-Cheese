Given(/^I have a pending adoption for "(.*?)"$/) do |name|
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout('name' => name)
end

When(/^I process that adoption$/) do
  visit(LandingPage)
  on(LoginPage).login_to_system
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy
end
