class Book < ApplicationRecord
  belongs_to :genre
  validates :title, :author, :publisher, presence: true
end
