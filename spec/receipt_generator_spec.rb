# frozen_string_literal: true

require './receipt_generator'

RSpec.describe ReceiptGenerator do
  let(:receipt_generator) { described_class.new }

  describe '#create' do
    subject { receipt_generator.create(params) }

    let(:params) { 'Output 1:' }
    let(:receipt) { instance_double(Receipt) }

    before { allow(Receipt).to receive(:new).and_return(receipt) }

    it 'creates a new receipt' do
      is_expected.to eq(receipt)
      expect(Receipt).to have_received(:new).with(params)
    end
  end

  describe '#add_product' do
    subject { receipt_generator.add_product(params) }

    let(:params) { '1 book at 10.5' }
    let(:receipt) { receipt_generator.create('Output 1:') }
    let(:product) { instance_double(Product) }

    before do
      allow(ProductFactory).to receive(:create_product).and_return(product)
      allow(receipt).to receive(:add_product)
      subject
    end

    it 'adds a product to the receipt' do
      expect(ProductFactory).to have_received(:create_product).with(params)
      expect(receipt).to have_received(:add_product).with(product)
    end
  end

  describe '#print' do
    subject { receipt_generator.print }

    let(:receipt) { receipt_generator.create('Output 1:') }

    before do
      allow(receipt).to receive(:print)
      subject
    end

    it 'prints the receipt' do
      expect(receipt).to have_received(:print)
    end
  end
end
