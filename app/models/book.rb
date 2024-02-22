class Book < ApplicationRecord
  validates :title, :author, :publisher, presence: true
end
