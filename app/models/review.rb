class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true, length: { minimum: 50, maximum:250 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  before_save(:titleize_author)
end

private
def titleize_author
  self.author = self.author.titleize
end
