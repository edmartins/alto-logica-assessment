# frozen_string_literal: true

require './product_translator'
require './product'

class ProductFactory
  def self.create_product(product_row)
    new(product_row).create_product
  end

  def initialize(product_row)
    @product_row = product_row
  end

  def create_product
    Product.new(
      quantity: product_translated.quantity,
      name: product_translated.name,
      price: product_translated.price
    )
  end

  private

  def product_translated
    @product_translated ||= ProductTranslator.extract_product_details(product_row)
  end

  attr_reader :product_row
end
