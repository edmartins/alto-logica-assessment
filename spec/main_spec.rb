# frozen_string_literal: true

require './main'
require './receipt'
require './product_factory'

RSpec.describe Main do
  describe '.generate_receipt_list' do
    subject { described_class.generate_receipt_list(file_path) }

    let(:file_path) { 'spec/test_input1' }
    let(:receipt) { instance_double(Receipt) }
    let(:product) { instance_double(Product) }
    let(:print_response) do
      <<~RECEIPT_LIST
        Output 1
        1 book: 10.50
        Sales Taxes: 0.00
        Total: 10.50
      RECEIPT_LIST
    end

    before do
      allow(Receipt).to receive(:new).and_return(receipt)
      allow(ProductFactory).to receive(:create_product).and_return(product)
      allow(receipt).to receive(:add_product)
      allow(receipt).to receive(:print).and_return(print_response)
    end

    it 'prints response' do
      is_expected.to eq(print_response)
      expect(ProductFactory).to have_received(:create_product).with('1 book at 10.5')
      expect(receipt).to have_received(:add_product).with(product)
    end
  end
end
