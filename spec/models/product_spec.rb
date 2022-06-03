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
  it("returns products originating in the usa") do
    product1 = Product.create({name: "product1", cost: 9, country_of_origin: "USA"})
    product2 = Product.create({name: "product2", cost: 9, country_of_origin: "COL"})
    product3 = Product.create({name: "product3", cost: 9, country_of_origin: "MEX"})
    expect(Product.usa()).to(eq([product1]))
  end
  it("returns product with most reviews") do
    product1 = Product.create({name: "product1", cost: 9, country_of_origin: "USA"})
    product2 = Product.create({name: "product2", cost: 9, country_of_origin: "COL"})
    review = Review.create({product_id: product1.id, author: "melvin", content_body: "Reiciendis quo in. Delectus vero sapiente. Conseq.", rating: 1})
    review2 = Review.create({product_id: product2.id, author: "gary", content_body: "Reiciendis quo in. Delectus vero sapiente. Conseq.", rating: 1})
    review3 = Review.create({product_id: product2.id, author: "bob", content_body: "Reiciendis quo in. Delectus vero sapiente. Conseq.", rating: 1})
    expect(Product.most_reviews()).to(eq([product2]))
  end
end