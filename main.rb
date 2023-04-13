# frozen_string_literal: true

require './receipt'
require './product_factory'

class Main
  def self.generate_receipt_list(file_path)
    new(file_path).generate_receipt_list
  end

  def initialize(file_path)
    @file_path = file_path
    @file_content_rows = read_and_split_file(file_path)
  end

  def generate_receipt_list
    receipt = Receipt.new(header)
    remove_header!
    file_content_rows.each do |row|
      product = ProductFactory.create_product(row)
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
    header = file_content_rows.first
    header['Input'] = 'Output'
    header
  end

  def remove_header!
    file_content_rows.shift
  end

  attr_reader :file_path, :file_content_rows
end
