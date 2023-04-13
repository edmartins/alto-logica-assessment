# frozen_string_literal: true

module ProductDictionary
  BOOK_KEYWORDS = %w[book].freeze
  FOOD_KEYWORDS = %w[chocolate bar].freeze
  MEDICAL_KEYWORDS = %w[pills].freeze
  ALL_KEYWORDS = {
    book: BOOK_KEYWORDS,
    food: FOOD_KEYWORDS,
    medical: MEDICAL_KEYWORDS
  }.freeze

  def type_of(name)
    product_type = :other
    ALL_KEYWORDS.each do |type, keywords|
      has_keyword = keywords.any? { |keyword| name.include?(keyword) }
      if has_keyword
        product_type = type
        break
      end
    end
    product_type
  end

  def imported?(name)
    name.include?('imported')
  end
end
