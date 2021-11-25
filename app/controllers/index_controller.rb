# frozen_string_literal: true

class String
  def palindrome?
    self == reverse
  end
end

class Integer
  def palindrome?
    to_s.palindrome?
  end
end

class IndexController < ApplicationController
  def input
    render layout: false
  end

  def output
    @result = 0.upto(Integer(params[:InputNumber]))&.select { |number| number.palindrome? && (number**2).palindrome? }
  rescue ArgumentError
    @error = 'Некорректный ввод'
  rescue TypeError
    @error = 'Число не задано'
  ensure
    respond_to do |format|
      format.html 
      format.json do
        render json: { type: @result.class.to_s, value: @result }
      end
    end
  end
end