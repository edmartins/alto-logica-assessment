# frozen_string_literal: true

require './product_dictionary'

class ProductDictionaryTest
  include ProductDictionary

  def test_product_type(name)
    product_type(name)
  end

  def test_imported?(name)
    imported?(name)
  end
end

RSpec.describe ProductDictionary do
  describe '.product_type' do
    subject(:test_class) { ProductDictionaryTest.new.test_product_type(name) }

    context 'when name is book' do
      let(:name) { 'book' }

      it { is_expected.to eq(:book) }
    end

    context 'when name is chocolate bar' do
      let(:name) { 'chocolate bar' }

      it { is_expected.to eq(:food) }
    end

    context 'when name is pills' do
      let(:name) { 'pills' }

      it { is_expected.to eq(:medical) }
    end

    context 'when name is music CD' do
      let(:name) { 'music CD' }

      it { is_expected.to eq(:other) }
    end
  end

  describe '.imported?' do
    subject { ProductDictionaryTest.new.test_imported?(name) }

    context 'when name is imported book' do
      let(:name) { 'imported book' }

      it { is_expected.to be_truthy }
    end

    context 'when name is book' do
      let(:name) { 'book' }

      it { is_expected.to be_falsy }
    end
  end
end
