# frozen_string_literal: true

require 'application_system_test_case'

class IndicesTest < ApplicationSystemTestCase
  test 'NegativeNumber' do
    visit root_url

    fill_in 'InputNumber', with: '-10'

    click_on(id: 'Result')

    assert_equal page.has_css?('#output-0'), false
    assert_equal find_field('Length').value, '0'
  end
  
  test 'InputNumber=121' do
    visit root_url

    fill_in 'InputNumber', with: '121'
    result = [0, 1, 2, 3, 11, 22, 101, 111, 121]

    click_on(id: 'Result')

    result.each_with_index { |elem, index| assert_selector "#output-#{index}", text: elem.to_s }

    assert_equal find_field('Length').value, result.length.to_s
  end
end
