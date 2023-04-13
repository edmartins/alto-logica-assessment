# frozen_string_literal: true

require 'ostruct'

class ProductTranslator
  def self.extract_product_details(product_row)
    new(product_row).extract_product_details
  end

  def initialize(product_row)
    @product_row = product_row
  end

  def extract_product_details
    quantity_and_name, price = product_row.split(' at ')
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

  attr_reader :product_row
end
