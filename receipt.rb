# frozen_string_literal: true

class Receipt
  def initialize(header)
    @header = header
    @products = []
  end

  def add_product(product)
    products << product
  end

  def print
    receipt = []
    sales_taxes = 0
    total = 0
    receipt << header
    products.each do |product|
      receipt << product.output_line
      sales_taxes += product.tax
      total += product.total_price
    end
    receipt << "Sales Taxes: #{format('%.2f', (sales_taxes * 20).round / 20.0)}"
    receipt << "Total: #{format('%.2f', total.round(2))}"
    receipt.join("\n")
  end

  private

  attr_reader :header, :products
end
