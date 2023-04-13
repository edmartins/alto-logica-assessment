# frozen_string_literal: true

require './product'

RSpec.describe Product do
  describe '#formatted_output' do
    subject { product.formatted_output }

    context 'when book' do
      let(:product) { described_class.new(quantity: 2, name: 'book', price: 12.49) }

      it { is_expected.to eq('2 book: 24.98') }
      it { expect(product.tax).to eq(0) }
    end

    context 'when imported bottle of perfurme' do
      let(:product) { described_class.new(quantity: 1, name: 'imported bottle of perfurme', price: 27.99) }

      it { is_expected.to eq('1 imported bottle of perfurme: 32.19') }
      it { expect(product.tax).to eq(4.1985) }
    end

    context 'when bottle of perfurme' do
      let(:product) { described_class.new(quantity: 1, name: 'bottle of perfurme', price: 18.99) }

      it { is_expected.to eq('1 bottle of perfurme: 20.89') }
      it { expect(product.tax).to eq(1.899) }
    end

    context 'when music CD' do
      let(:product) { described_class.new(quantity: 1, name: 'music CD', price: 14.99) }

      it { is_expected.to eq('1 music CD: 16.49') }
      it { expect(product.tax).to eq(1.499) }
    end

    context 'when chocolate bar' do
      let(:product) { described_class.new(quantity: 1, name: 'chocolate bar', price: 0.85) }

      it { is_expected.to eq('1 chocolate bar: 0.85') }
      it { expect(product.tax).to eq(0) }
    end

    context 'when imported boxes of chocolates' do
      let(:product) { described_class.new(quantity: 3, name: 'imported boxes of chocolates', price: 11.25) }

      it { is_expected.to eq('3 imported boxes of chocolates: 35.44') }
      it { expect(product.tax).to eq(0.5625) }
    end
  end
end
