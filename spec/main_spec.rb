# frozen_string_literal: true

require './main'

RSpec.describe Main do
  describe '.generate_receipt_list' do
    subject { described_class.generate_receipt_list(file_path) }

    let(:file_path) { 'spec/test_input1' }
    let(:receipt) { instance_double(ReceiptGenerator) }
    let(:print_response) do
      <<~RECEIPT_LIST
        Output 1
        1 book: 10.50
        Sales Taxes: 0.00
        Total: 10.50
      RECEIPT_LIST
    end

    before do
      allow(ReceiptGenerator).to receive(:new).and_return(receipt)
      allow(receipt).to receive(:create)
      allow(receipt).to receive(:add_product)
      allow(receipt).to receive(:print).and_return(print_response)
    end

    it 'prints response' do
      is_expected.to eq(print_response)
      expect(receipt).to have_received(:create).with('Output 1:')
      expect(receipt).to have_received(:add_product).with('1 book at 10.5')
    end
  end
end
