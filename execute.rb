# frozen_string_literal: true

require './main'

args = ARGV.to_a
input_file_path = args.first

puts Main.generate_receipt_list(input_file_path)
