class Product < ApplicationRecord
  scope :usa, -> { where(country_of_origin: "USA") }
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  has_many :reviews, dependent: :destroy
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("tasks_count DESC")
    .limit(1)
    )}
  validates :name, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10000000 }
  validates :country_of_origin, presence: true
  before_save(:titleize_product)
end

private
def titleize_product
  self.name = self.name.titleize
end
