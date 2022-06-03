require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it("titleizes the name of an product") do
    product = Product.create({name: "product", cost: 9, country_of_origin: "USA"})
    expect(product.name()).to(eq("Product"))
  end
  it("returns the last 3 added products") do
    product1 = Product.create({name: "product1", cost: 9, country_of_origin: "USA"})
    product2 = Product.create({name: "product2", cost: 9, country_of_origin: "USA"})
    product3 = Product.create({name: "product3", cost: 9, country_of_origin: "USA"})
    expect(Product.three_most_recent()).to(eq([product3, product2, product1]))
  end
end