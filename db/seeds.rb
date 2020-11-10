# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password')

user.add_role :admin

ProductListing.create!([
    {
        name: "Pochette Metis", 
        brand: "Louis Vuitton", 
        description: "Perfect condition", 
        price: 2000.0, 
        category: "Shoulder Bag", 
        colour: "Other", 
        approved: true, 
        user_id: 2
    },
    name: "Marmont Mini", 
    brand: "Chanel", 
    description: "Perfect condition", 
    price: 1900.0, 
    category: "Shoulder Bag", 
    colour: "Black", 
    approved: false, 
    user_id: 1
})



