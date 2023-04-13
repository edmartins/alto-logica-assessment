# frozen_string_literal: true

require './product_factory'
require './product_translator'
require './product'

RSpec.describe ProductFactory do
  describe '.create_product' do
    subject { described_class.create_product(params) }

    let(:params) { '1 book at 10.5' }
    let(:translated_params) { { quantity: 1, name: 'book', price: 10.5 } }
    let(:product_translated) { double('ProductTranslator', translated_params) }
    let(:product) { instance_double(Product) }

    before do
      allow(ProductTranslator).to receive(:extract_product_details).and_return(product_translated)
      allow(Product).to receive(:new).and_return(product)
    end

    it 'creates a product' do
      is_expected.to eq(product)
      expect(ProductTranslator).to have_received(:extract_product_details).with(params)
      expect(Product).to have_received(:new).with(translated_params)
    end
  end
end
