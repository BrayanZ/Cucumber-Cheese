require 'rubygems'
require 'watir-webdriver'
require_relative './adoption_helper.rb'

include AdoptionHelper

go_to_the_adoption_site
adopt_puppy_number 0
adopt_another_puppy
adopt_puppy_number 1
checkout_with('Cheezy', '123 Main St.', 'cheezy@foo.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!'
close_browser
