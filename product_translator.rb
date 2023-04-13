# frozen_string_literal: true

require 'ostruct'

class ProductTranslator
  def self.translate(product_line)
    new(product_line).translate
  end

  def initialize(product_line)
    @product_line = product_line
  end

  def translate
    quantity_and_name, price = product_line.split(' at ')
    quantity_and_name_array = quantity_and_name.split(' ')
    quantity = quantity_and_name_array.first
    quantity_and_name_array.shift
    name = quantity_and_name_array.join(' ')
    OpenStruct.new(
      quantity: quantity.to_i,
      name:,
      price: price.to_f
    )
  end

  private

  attr_reader :product_line
end
