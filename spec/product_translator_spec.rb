# frozen_string_literal: true

require './product_translator'

RSpec.describe ProductTranslator do
  describe '.extract_product_details' do
    subject(:product_translated) { described_class.extract_product_details(product_line) }

    let(:product_line) { '3 imported boxes of chocolates at 11.25' }

    it 'extracts product details' do
      expect(product_translated.quantity).to eq(3)
      expect(product_translated.name).to eq('imported boxes of chocolates')
      expect(product_translated.price).to eq(11.25)
    end
  end
end
