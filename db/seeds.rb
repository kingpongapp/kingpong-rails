# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.delete_all
Player.create(name: 'Ross', email: 'xyz@gmail.com', password: 'xyz', image_url: "https://images-na.ssl-images-amazon.com/images/I/41kbIruQrnL.jpg", score: 100)
Player.create(name: 'Anu', email: 'abc@gmail.com', password: 'abc', image_url: "https://images-na.ssl-images-amazon.com/images/I/41kbIruQrnL.jpg", score: 100)
Player.create(name: 'Rob', email: '123@gmail.com', password: '123', image_url: "https://images-na.ssl-images-amazon.com/images/I/41kbIruQrnL.jpg", score: 100)

# ¸

# name = ['Fouad', 'Anu', 'Robbie', 'Ross', 'Alex']
# nickname = ['muffin', 'noodles', 'candy', 'slicer', 'ponger', 'smashoff', 'sponge']

# 20.times do
#   Player.create(
#     name: name.sample, email: "test@gmail.com", nickname: nickname.sample, image_url: "https://images-na.ssl-images-amazon.com/images/I/41kbIruQrnL.jpg", score: rand(100..500), password: 'test'
#   )
# end
