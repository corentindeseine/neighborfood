# Seed Users
Order.destroy_all
User.destroy_all
require "open-uri"
10.times do
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               city: "Paris",
               zip_code: 75_011,
               email: Faker::Internet.email,
               phone_number: "+33601020304",
               password: "neighborfood")
end

# Les trois addresses qui ont des plats différents + ajout des avatars

users = User.all

users[0].address = "89 Rue Jean-Pierre Timbaud"
user_1_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655193961/cuistot1_p0veba.png")
users[0].image.attach(io: user_1_avatar, filename: 'user1.png', content_type: 'image/png')

users[1].address = "148 Rue Oberkampf"
user_2_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot2_dvxnbh.png")
users[1].image.attach(io: user_2_avatar, filename: 'user2.png', content_type: 'image/png')

users[2].address = "117 Rue Saint-Maur"
user_3_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot3_gbtqwu.png")
users[2].image.attach(io: user_3_avatar, filename: 'user3.png', content_type: 'image/png')

# Les autres addresses qui ont un même plat commun

users[3].address = "3 rue Rochebrune"
user_4_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot4._zccuac.png")
users[3].image.attach(io: user_4_avatar, filename: 'user4.png', content_type: 'image/png')

users[4].address = "29 passage de Ménilmontant"
user_5_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot5_xlr75z.png")
users[4].image.attach(io: user_5_avatar, filename: 'user5.png', content_type: 'image/png')

users[5].address = "7 Rue de la Fontaine au Roi"
user_6_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot6_dstbnd.png")
users[5].image.attach(io: user_6_avatar, filename: 'user6.png', content_type: 'image/png')

users[6].address = "107 avenue Parmentier"
user_7_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot7_eukcbw.png")
users[6].image.attach(io: user_7_avatar, filename: 'user7.png', content_type: 'image/png')

users[7].address = "1 Rue Saint-Hubert"
user_8_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot8_ywb2np.png")
users[7].image.attach(io: user_8_avatar, filename: 'user8.png', content_type: 'image/png')

users[8].address = "20 rue de l'Orillon"
user_9_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot9_dv91qs.png")
users[8].image.attach(io: user_9_avatar, filename: 'user9.png', content_type: 'image/png')

users[9].address = "4 villa gaudelet"
user_10_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot10_icg0tz.png")
users[9].image.attach(io: user_10_avatar, filename: 'user10.png', content_type: 'image/png')

users.map(&:save!)

# Seed meals pour user 1

couscous = Meal.create!(name: 'Couscous',
                        description: 'Le meilleur couscous de Paname !',
                        unit_price: 12,
                        ingredients: "semoule, merguez, poulet, courgettes, aubergines, carotte, pois chiches",
                        range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
                        available_quantity: 3,
                        user_id: users[0].id)
couscous_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655039167/couscous-removebg-preview_1_ay6jrr.png")
couscous.image.attach(io: couscous_file, filename: 'couscous.jpg', content_type: 'image/jpg')

tajine = Meal.create!(name: "Tajine de poulet",
                      description: 'Comme un retour au Maroc !',
                      unit_price: 9.9,
                      ingredients: "pomme de terre, courgettes, poulet, carottes, oignon, tomates, cumin",
                      range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
                      available_quantity: 2,
                      user_id: users[0].id)
tajine_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655037823/tajine-removebg-preview_z0onqs.png")
tajine.image.attach(io: tajine_file, filename: 'Tajine.png', content_type: 'image/png')

pastilla = Meal.create!(name: 'Pastilla',
                        description: 'Mon plat le plus apprécié de tous !',
                        unit_price: 4.5,
                        ingredients: "poulet, amandes, oignons, pignon, feuilles de brick, persil",
                        range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
                        available_quantity: 5,
                        user_id: users[0].id)
pastilla_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655038011/Pastilla-au-poulet-et-amandes-le-traiteur-de-la-bourse-removebg-preview_fjyynx.png")
pastilla.image.attach(io: pastilla_file, filename: 'Pastilla.png', content_type: 'image/png')

# Seed meals pour user 2
tartare_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1654947934/Tartare-thon_j1ufi0.png")
tartare = Meal.create!(name: 'Tartare de thon',
                       description: 'Une recette équilibrée me rappelant mon enfance à la mer !',
                       unit_price: 10,
                       ingredients: "thon frais, capres, oignons, huile d'olive, sauce créoline ",
                       range_date_time: "['06/14/2022 17:00' , '06/14/2022 19:00']",
                       available_quantity: 4,
                       user_id: users[1].id)
tartare.image.attach(io: tartare_file, filename: 'Tartare-thon.png', content_type: 'image/png')

tataki = Meal.create!(name: 'Tataki de thon',
                      description: "Un tataki de thon frais avec du guacamole et une délicieuse salade d'ananas",
                      unit_price: 12.5,
                      ingredients: "thon, avocat, ananas, poivron, piment doux, citron vert, persil, huile d'olive ",
                      range_date_time: "06/14/2022 20:00 , 06/14/2022 22:00",
                      available_quantity: 2,
                      user_id: users[1].id)
tataki_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1654947895/Tataki-thon_biymqi.png")
tataki.image.attach(io: tataki_file, filename: 'Tataki-thon.png', content_type: 'image/png')

# Seed meals pour user 3
falafels = Meal.create!(name: 'Falafels',
                        description: 'Le Liban dans votre assiette',
                        unit_price: 2.5,
                        ingredients: "pois chiches, gousse d'ail, oignon, persil",
                        range_date_time: "06/14/2022 18:00 , 06/14/2022 22:00",
                        available_quantity: 15,
                        user_id: users[2].id)
falafels_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655037803/1200px-Bowl_of_falafel-removebg-preview_mi9x1u.png")
falafels.image.attach(io: falafels_file, filename: 'Falafels.png', content_type: 'image/png')

# Seed meals pour users de 4 à 10

users.each_with_index do |user, index|
  next if index < 3

 quiche = Meal.create!(name: 'Quiche Lorraine',
               description: 'Un classique de la gastronomie française revisité par mes soins',
               unit_price: rand(5..8),
               ingredients: "pâte brisée, lardons, oeufs ,crème fraîche",
               range_date_time: "06/14/2022 18:00 , 06/14/2022 22:00",
               available_quantity: rand(2..6),
               user_id: user.id)
others_users_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655243158/quiche-removebg-preview_fqgtbe.png")
quiche.image.attach(io: others_users_file, filename: 'quiche.png', content_type: 'image/png')
end

# Seed user account

client = User.create!(first_name: "Jeanne",
                      last_name: "Lafondue",
                      address: "16, Villa Gaudelet",
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
