# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password')

admin.add_role :admin

user = User.create!(email: 'test@test.com',
    password: 'password',
    password_confirmation: 'password',
)

ProductListing.destroy_all
bag_1 = ProductListing.new(name: "Pochette Metis", 
    brand: "Louis Vuitton", 
    description: "Perfect condition", 
    price: 2000.0, 
    category: "Shoulder Bag", 
    colour: "Other", 
    approved: true,
    user_id: 1)
    bag_1.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/pochette_metis.png')), filename: 'pochette_metis.png')
    bag_1.save
bag_2 = ProductListing.new(name: "Marmont Mini", 
    brand: "Gucci", 
    description: "Perfect condition", 
    price: 1900.0, 
    category: "Shoulder Bag", 
    colour: "Black",
    approved: false,
    user_id: 1)
    bag_2.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/marmont_mini.png')), filename: 'marmont_mini.png')
    bag_2.save
   

# image: URI.open("https://res.cloudinary.com/ashlii/image/upload/v1604746374/9rwkf6dcii7blhvp90ebpl25d5ce.png"),

