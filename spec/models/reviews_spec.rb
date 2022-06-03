require 'rails_helper'

describe Review do
  it {should belong_to (:product)}
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating}
  it("titleizes the name of an author") do
    product = Product.create({name: "product", cost: 9, country_of_origin: "USA"})
    expect(product.name()).to(eq("Product"))
    review = Review.create({product_id: product.id, author: "gary", content_body: "Reiciendis quo in. Delectus vero sapiente. Conseq.", rating: 1})
    expect(review.author()).to(eq("Gary"))
  end
end