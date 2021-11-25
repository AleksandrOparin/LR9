require "application_system_test_case"

class IndicesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit root_url
    
    fill_in "InputNumber", with: "100"
    
    click_button "Result"

    # assert_selector "h1", text: "Ввод числа"
    # raise 'element missing!' unless page.has_css?('#output0')
    # assert_selector "td", id: "output0", text: "0"
    # assert_selector "input", id: "Length", text: ""
    assert_selector "#output0",  text: "0"
  end
end
