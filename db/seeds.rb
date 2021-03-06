# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
admin = User.create!(email: ENV["ADMIN_EMAIL"],
    password: ENV["ADMIN_PASSWORD"],
    password_confirmation: ENV["ADMIN_PASSWORD"], 
    first_name: 'Admin', 
    last_name: 'Account', 
    contact_number: '1111111111', 
    address: '42 Wallaby Way', 
    suburb: 'Brisbane', 
    state: 'QLD', 
    postcode: 4000
)
admin.add_role :admin

user = User.create!(email: ENV["USER_EMAIL"],
    password: ENV["USER_PASSWORD"],
    password_confirmation: ENV["USER_PASSWORD"], 
    first_name: 'Test', 
    last_name: 'Account', 
    contact_number: '1111111111', 
    address: '42 Wallaby Way', 
    suburb: 'Brisbane', 
    state: 'QLD', 
    postcode: 4000
)



ProductListing.destroy_all
bag_1 = ProductListing.new(name: "Pochette Metis", 
    brand: "Louis Vuitton", 
    description: "Perfect condition", 
    price: 2000.0, 
    category: "Shoulder Bag", 
    colour: "Other", 
    approved: true,
    user_id: admin.id
)
bag_1.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lv_purse.jpg')), filename: 'lv_purse.jpg')
bag_1.save!
bag_2 = ProductListing.new(name: "Chanel Classic", 
    brand: "Chanel", 
    description: "Perfect condition", 
    price: 1900.0, 
    category: "Shoulder Bag", 
    colour: "White",
    approved: true,
    user_id: admin.id
)
    bag_2.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Chanel_Classic.jpg')), filename: 'Chanel_Classic.jpg')
    bag_2.save!
bag_3 = ProductListing.new(name: "Pochette Metis", 
    brand: "Louis Vuitton", 
    description: "Perfect condition", 
    price: 2000.0, 
    category: "Shoulder Bag", 
    colour: "Other", 
    approved: true,
    user_id: admin.id
)
    bag_3.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lv_purse.jpg')), filename: 'lv_purse.jpg')
    bag_3.save
bag_4 = ProductListing.new(name: "Chanel Classic", 
    brand: "Chanel", 
    description: "Perfect condition", 
    price: 1900.0, 
    category: "Shoulder Bag", 
    colour: "White",
    approved: false,
    user_id: admin.id
)
    bag_4.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Chanel_Classic.jpg')), filename: 'Chanel_Classic.jpg')
    bag_4.save
bag_5 = ProductListing.new(name: "Pochette Metis", 
    brand: "Louis Vuitton", 
    description: "Perfect condition", 
    price: 2000.0, 
    category: "Shoulder Bag", 
    colour: "Other", 
    approved: true,
    user_id: admin.id
)
    bag_5.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lv_purse.jpg')), filename: 'lv_purse.jpg')
    bag_5.save
bag_6 = ProductListing.new(name: "Pochette Metis", 
    brand: "Louis Vuitton", 
    description: "Perfect condition", 
    price: 2000.0, 
    category: "Shoulder Bag", 
    colour: "Other", 
    approved: true,
    user_id: admin.id
)
    bag_6.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/lv_purse.jpg')), filename: 'lv_purse.jpg')
    bag_6.save
bag_7 = ProductListing.new(name: "Chanel Classic", 
    brand: "Chanel", 
    description: "Perfect condition", 
    price: 1900.0, 
    category: "Shoulder Bag", 
    colour: "White",
    approved: true,
    user_id: admin.id
)
    bag_7.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Chanel_Classic.jpg')), filename: 'Chanel_Classic.jpg')
    bag_7.save
   

# image: URI.open("https://res.cloudinary.com/ashlii/image/upload/v1604746374/9rwkf6dcii7blhvp90ebpl25d5ce.png"),

