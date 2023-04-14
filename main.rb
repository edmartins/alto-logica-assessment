# frozen_string_literal: true

require './receipt_generator'

class Main
  def self.generate_receipt_list(file_path, receipt = ReceiptGenerator.new)
    new(file_path, receipt).generate_receipt_list
  end

  def initialize(file_path, receipt = ReceiptGenerator.new)
    @file_path = file_path
    @receipt = receipt
    @file_content_rows = read_and_split_file(file_path)
  end

  def generate_receipt_list
    receipt.create(header)
    remove_header!
    file_content_rows.each do |row|
      receipt.add_product(row)
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

  attr_reader :file_path, :receipt, :file_content_rows
end
