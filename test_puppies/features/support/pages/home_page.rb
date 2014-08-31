class HomePage
  include PageObject

  page_url('http://puppies.herokuapp.com')

  def select_puppy_number(number)
    button_element(value: 'View Details', index: number-1).click
  end
end
