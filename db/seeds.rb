# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'Machine learning', priority: "A=> High")
Category.create(name: 'Voice recognition', priority: "B=> Medium")
Category.create(name: 'Artificial Intelligence', priority: "A=> High")
Category.create(name: 'Robotics', priority: "A=> High")
User.create(email: 'mina@mail', username: 'mina')
Article.create(author_id: 1, title: 'Machine learning', content: 'Lorem ipsum', category_id: 1)
