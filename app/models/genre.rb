class Genre < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: { maximum: 50 }

  # Validates uniqueness
  validates :name, uniqueness: true

  # Validates format using a regular expression
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end

