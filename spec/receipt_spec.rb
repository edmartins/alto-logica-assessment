# frozen_string_literal: true

require './receipt'
require './product'

RSpec.describe Receipt do
  describe '#add_product' do
    subject { receipt.add_product(product) }

    let(:receipt) { described_class.new('Output 1') }
    let(:product) { Product.new(quantity: 2, name: 'book', price: 12.49) }

    it { expect { subject }.to change { receipt.send(:products).size }.by(1) }
  end

  describe '#print' do
    subject { receipt.print }

    let(:receipt) { described_class.new('Output 1') }
    let(:print_response) do
      <<~RECEIPT_LIST
        Output 1
        2 book: 24.98
        1 music CD: 16.49
        1 imported bottle of perfurme: 32.19
        Sales Taxes: 5.70
        Total: 73.66
      RECEIPT_LIST
    end

    before do
      receipt.add_product(Product.new(quantity: 2, name: 'book', price: 12.49))
      receipt.add_product(Product.new(quantity: 1, name: 'music CD', price: 14.99))
      receipt.add_product(Product.new(quantity: 1, name: 'imported bottle of perfurme', price: 27.99))
    end

    it { is_expected.to eq(print_response.strip) }
  end
end
