require 'rubygems'
require 'watir-webdriver'
browser = Watir::Browser.new :firefox
browser.goto 'http://puppies.herokuapp.com'
sleep 5
browser.close
