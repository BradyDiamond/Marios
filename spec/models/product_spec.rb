require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it("saves a product") do
    product = Product.create({name: "product", cost: 9, country_of_origin: "USA"})
    expect(product.name()).to(eq("product"))
  end
end