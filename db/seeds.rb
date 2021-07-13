# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    User.create({"username"=>"mina", "email"=>"mina@mail"})
    User.create({"username"=>"admin", "email"=>"admin@mail"})
    Category.create({"name"=>"Machine Learning", "priority"=>"A => High"})
    Category.create({"name"=>"Robotics", "priority"=>"B => Medium"})
    
    file = Rails.root.join('app', 'assets', 'images', 'img1.png')
    image = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file, 'rb'),
      filename: 'img1.png',
      content_type: 'image/png'
    ).signed_id

    Category.first.articles.create(
      author_id: 1,
      title: 'Machine learn',
      content: "Lorem Ipsum",
      category_id: 1,
      image: image 
      
    ) 

    Category.last.articles.create(
      author_id: 2,
      title: 'Electric car',
      content: "Lorem Ipsum",
      category_id: 2,
      image: image 
    )

    Vote.create({"user_id"=>1, "article_id"=>1})
