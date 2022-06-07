# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

# Seed Users

10.times do
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               city: "Paris",
               zip_code: 75_011,
               email: Faker::Internet.email,
               phone_number: "+33601020304",
               password: "neighborfood")
end

users = User.all

users[0].address = "83 Rue Jean-Pierre Timbaud"
users[1].address = "148 Rue Oberkampf"
users[2].address = "1 Rue Saint-Hubert"
users[3].address = "30 Rue Moret"
users[4].address = "10 Rue des Nanettes"
users[5].address = "7 Rue de la Fontaine au Roi"
users[6].address = "83 Bd de Ménilmontant"
users[7].address = "148 Rue Oberkampf"
users[8].address = "18 Rue des Bluets"
users[9].address = "121 Rue Saint-Maur"

users.map(&:save!)

# Seed meals pour user 1

Meal.create!(name: 'Couscous',
             description: 'Le meilleur couscous de Paname !',
             unit_price: 7.2,
             ingredients: "['semoule', 'merguez', 'poulet', 'courgettes', 'aubergines', 'carotte', 'pois chiches']",
             range_date_time: "['06/14/2022 17:00' , '06/14/2022 19:00']",
             available_quantity: 5,
             user_id: user[0].id)

Meal.create!(name: "Tajine de poulet",
             description: 'Comme un retour au Maroc !',
             unit_price: 9.2,
             ingredients: "['pomme de terre', 'courgettes', 'poulet', 'carottes', 'oignon', 'tomates', 'cumin']",
             range_date_time: "['06/14/2022 17:00' , '06/14/2022 19:00']",
             available_quantity: 2,
             user_id: user[0].id)

Meal.create!(name: 'Pastilla',
             description: 'Mon plat le plus apprécié de tous !',
             unit_price: 7.2,
             ingredients: "['poulet', 'amandes', 'oignons', 'Pignon', 'aubergines', 'carotte', 'pois chiches']",
             range_date_time: "['06/14/2022 17:00' , '06/14/2022 19:00']",
             available_quantity: 5,
             user_id: user[0].id)
