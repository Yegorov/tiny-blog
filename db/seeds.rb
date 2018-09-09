# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = FactoryBot.create(:user, name: "Artem Yegorov")

FactoryBot.create(:post, with_featured_image, author: user)
FactoryBot.create(:post, with_featured_image, filename: "pexels-photo-314380-large.jpeg", author: user)

FactoryBot.create_list(:post, 25, author: user)
