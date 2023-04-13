# frozen_string_literal: true

require './product_translator'

RSpec.describe ProductTranslator do
  describe '.translate' do
    subject(:product_translated) { described_class.translate(product_line) }

    let(:product_line) { '3 imported boxes of chocolates at 11.25' }

    it 'translates product values' do
      expect(product_translated.quantity).to eq(3)
      expect(product_translated.name).to eq('imported boxes of chocolates')
      expect(product_translated.price).to eq(11.25)
    end
  end
end
