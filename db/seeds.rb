# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'
require 'faker'

# Delete existing data
Book.destroy_all
Genre.destroy_all

# Seed genres
genres = ['signal_processing', 'data_science', 'mathematics', 'economics', 'history', 'science', 'psychology', 'fiction', 'computer_science', 'nonfiction', 'philosophy', 'comic']
genres.each do |genre_name|
  Genre.create(name: genre_name)
end

# Seed books from CSV
csv_text = File.read(Rails.root.join('db', 'Books.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  genre = Genre.find_by(name: row['Genre'])
  Book.create(title: row['Title'], author: row['Author'], height: row['Height'], publisher: row['Publisher'], genre: genre)
end

# Seed additional books using Faker
200.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    height: Faker::Number.decimal(l_digits: 2),
    publisher: Faker::Book.publisher,
    genre: Genre.all.sample
  )
end
