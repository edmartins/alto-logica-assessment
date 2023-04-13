# frozen_string_literal: true

require './product_dictionary'

class Product
  include ProductDictionary

  attr_reader :quantity, :name, :tax, :total_price

  def initialize(quantity:, name:, price:)
    @quantity = quantity
    @name = name
    @price = price
    @type = product_type(name)
    @is_imported = imported?(name)
    @tax = calculate_tax
    @total_price = (quantity * (price + tax)).round(2)
  end

  def formatted_output
    "#{quantity} #{name}: #{format('%.2f', total_price)}"
  end

  private

  def calculate_tax
    final_tax = type == :other ? price * 0.1 : 0
    is_imported ? final_tax + (price * 0.05) : final_tax
  end

  attr_reader :price, :type, :is_imported
end
