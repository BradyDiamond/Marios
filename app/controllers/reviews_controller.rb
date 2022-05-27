class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @Review = @product.review.new
    render :new
  end
end