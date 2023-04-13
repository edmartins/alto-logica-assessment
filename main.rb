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
    @file_content_lines = read_and_split_file(file_path)
  end

  def generate_receipt_list
    receipt = Receipt.new(header)
    remove_header!
    file_content_lines.each do |line|
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

  def read_and_split_file(file_path)
    content = File.read(file_path)
    puts content
    puts '-----------------'
    content.split("\n")
  end

  def header
    header = file_content_lines.first
    header['Input'] = 'Output'
    header
  end

  def remove_header!
    file_content_lines.shift
  end

  attr_reader :file_path, :file_content_lines
end
