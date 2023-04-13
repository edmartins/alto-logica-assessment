# frozen_string_literal: true

require './receipt'
require './product'
require './product_translator'

class Main
  def self.generate_receipt_list(file_path)
    new(file_path).generate_receipt_list
  end

  def initialize(file_path)
    @file_path = file_path
  end

  def generate_receipt_list
    fetch_lines_and_initialize_receipt.each do |line|
      product_translated = ProductTranslator.extract_product_details(line)
      product = Product.new(
        quantity: product_translated.quantity,
        name: product_translated.name,
        price: product_translated.price
      )
      receipt.add_product(product)
    end
    receipt.print
  end

  private

  def fetch_lines_and_initialize_receipt
    input_content = File.read(file_path)
    puts input_content
    puts '-----------------'
    lines = input_content.split("\n")
    header = lines.first
    header['Input'] = 'Output'
    lines.shift
    @receipt = Receipt.new(header)
    lines
  end

  attr_reader :file_path, :receipt
end
