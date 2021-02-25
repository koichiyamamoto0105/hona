# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(
#   email: 'lyon@test.com',
#   name: 'pierrelyon',
#   nickname: 'lyon',
#   country: 'FR'
#   )

Map.create!(
  address: '甲子園球場',
  latitude: 34.721372200000005,
  longitude: 135.36164729804025,
  spotname: '甲子園球場',
  user_id: 1
  )
