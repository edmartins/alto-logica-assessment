# frozen_string_literal: true

require './receipt'
require './product_factory'

class ReceiptGenerator
  def create(header)
    @receipt = Receipt.new(header)
  end

  def add_product(row)
    product = ProductFactory.create_product(row)
    receipt.add_product(product)
  end

  def print
    receipt.print
  end

  private

  attr_reader :receipt
end
