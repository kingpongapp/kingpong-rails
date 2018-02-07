# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Player.create(name: 'Ross', email: 'xyz@gmail.com', password: 'xyz')
# Player.create(name: 'Anu', email: 'abc@gmail.com', password: 'abc')
# Player.create(name: 'Rob', email: '123@gmail.com', password: '123')

Player.delete_all


arr1 = ['mistyrose', 'pudding', 'byteme']
arr2 = ['muffin', 'noodles', 'candy']

player = Player.new
player.name = 
player.email = 'ross.lillis@gmail.com'
player.save

20.times do
  Player.create(
    title: "#{arr1.sample} #{arr2.sample}", user_id: user.id
  )
end
