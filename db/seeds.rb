# Seed Users
Order.destroy_all
User.destroy_all

10.times do
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               city: "Paris",
               zip_code: 75_011,
               email: Faker::Internet.email,
               phone_number: "+33601020304",
               password: "neighborfood")
end

# Les trois addresses qui ont des plats différents
users = User.all
users[0].address = "83 Rue Jean-Pierre Timbaud"
users[1].address = "148 Rue Oberkampf"
users[2].address = "117 Rue Saint-Maur"

# Les autres addresses qui ont un même plat commun
users[3].address = "30 Rue Moret"
users[4].address = "10 Rue des Nanettes"
users[5].address = "7 Rue de la Fontaine au Roi"
users[6].address = "83 Bd de Ménilmontant"
users[7].address = "1 Rue Saint-Hubert"
users[8].address = "18 Rue des Bluets"
users[9].address = "121 Rue Saint-Maur"

users.map(&:save!)

# Seed meals pour user 1

Meal.create!(name: 'Couscous',
             description: 'Le meilleur couscous de Paname !',
             unit_price: 12,
             ingredients: "semoule, merguez, poulet, courgettes, aubergines, carotte, pois chiches",
             range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
             available_quantity: 3,
             user_id: users[0].id)

Meal.create!(name: "Tajine de poulet",
             description: 'Comme un retour au Maroc !',
             unit_price: 9.9,
             ingredients: "pomme de terre, courgettes, poulet, carottes, oignon, tomates, cumin",
             range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
             available_quantity: 2,
             user_id: users[0].id)

Meal.create!(name: 'Pastilla',
             description: 'Mon plat le plus apprécié de tous !',
             unit_price: 4.5,
             ingredients: "poulet, amandes, oignons, pignon, feuilles de brick, persil",
             range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
             available_quantity: 5,
             user_id: users[0].id)

# Seed meals pour user 2

Meal.create!(name: 'Tartare de thon',
             description: 'Une recette équilibrée me rappelant mon enfance à la mer !',
             unit_price: 10,
             ingredients: "thon frais, capres, oignons, huile d'olive, sauce créoline ",
             range_date_time: "['06/14/2022 17:00' , '06/14/2022 19:00']",
             available_quantity: 4,
             user_id: users[1].id)

Meal.create!(name: 'Tataki de thon',
             description: "Un tataki de thon frais avec du guacamole et une délicieuse salade d'ananas",
             unit_price: 12.5,
             ingredients: "thon, avocat, ananas, poivron, piment doux, citron vert, persil, huile d'olive ",
             range_date_time: "06/14/2022 20:00 , 06/14/2022 22:00",
             available_quantity: 2,
             user_id: users[1].id)

# Seed meals pour user 3

Meal.create!(name: 'Falafels',
             description: 'Le Liban dans votre assiette',
             unit_price: 2.5,
             ingredients: "pois chiches, gousse d'ail, oignon, persil",
             range_date_time: "06/14/2022 18:00 , 06/14/2022 22:00",
             available_quantity: 15,
             user_id: users[2].id)

# Seed meals pour users de 4 à 10

users.each_with_index do |user, index|
  next if index < 3

  Meal.create!(name: 'Quiche Lorraine',
               description: 'Un classique de la gastronomie française revisité par mes soins',
               unit_price: rand(5..8),
               ingredients: "pâte brisée, lardons, oeufs ,crème fraîche",
               range_date_time: "06/14/2022 18:00 , 06/14/2022 22:00",
               available_quantity: rand(2..6),
               user_id: user.id)
end

# Seed user account

client = User.create!(first_name: "Jeanne",
                      last_name: "Lafondue",
                      address: "14, Villa Gaudelet",
                      city: "Paris",
                      zip_code: 75_011,
                      email: "user@gmail.com",
                      phone_number: "+33601020304",
                      password: "neighborfood")

# Seed orders

Order.create!(client_id: client.id,
              cooker_id: users[0].id,
              delivery_date_time: "Vendredi 10 Juin 2022 18H00",
              status: 1)
Order.create!(client_id: client.id,
              cooker_id: users[0].id,
              delivery_date_time: "Samedi 11 Juin 2022 18H00",
              status: 0)
Order.create!(client_id: client.id,
              cooker_id: users[1].id,
              delivery_date_time: "Lundi 13 Juin 2022 17H00",
              status: 0)

 # Seed orders_details
meals = Meal.all
orders = Order.all

OrderDetail.create!(order_id: orders[0].id,
                    meal_id: meals[0].id,
                    ordered_quantity: 2)
OrderDetail.create!(order_id: orders[1].id,
                    meal_id: meals[0].id,
                    ordered_quantity: 1)
OrderDetail.create!(order_id: orders[1].id,
                    meal_id: meals[1].id,
                    ordered_quantity: 1)
OrderDetail.create!(order_id: orders[2].id,
                    meal_id: meals[4].id,
                    ordered_quantity: 1)
