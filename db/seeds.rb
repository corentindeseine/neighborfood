# Seed Users
Order.destroy_all
Review.destroy_all
User.destroy_all

require "open-uri"
13.times do
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

users[0].email = "ibrahima@gmail.com"
users[0].first_name = "Ibrahima"
users[0].last_name = "Kaba"
users[0].address = "89 Rue Jean-Pierre Timbaud"
user_1_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655193961/cuistot1_p0veba.png")
users[0].image.attach(io: user_1_avatar, filename: 'user1.png', content_type: 'image/png')
users[0].speciality = "Poissons & desserts"
users[0].description = "J'adore cuisiner les meilleurs poissons que je trouve au marché. "

users[1].email = "boris@gmail.com"
users[1].first_name = "Boris"
users[1].last_name = "Bourdet"
users[1].address = "22 Rue de la Folie Méricourt"
user_2_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot2_dvxnbh.png")
users[1].image.attach(io: user_2_avatar, filename: 'user2.png', content_type: 'image/png')
users[1].speciality = "Cuisine Marocaine"
users[1].description = "Je mitonne pour vous les meilleures recettes traditionnelles de la cuisine marocaine. "

users[2].email = "mohamed@gmail.com"
users[2].first_name = "Mohamed"
users[2].last_name = "Cheikh"
users[2].address = "117 Rue Saint-Maur"
user_3_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot3_gbtqwu.png")
users[2].image.attach(io: user_3_avatar, filename: 'user3.png', content_type: 'image/png')
users[2].speciality = "Cuisine Libanaise"
users[2].description = "Découvrez mes recettes inspirées de la cuisine libanaise. "

# Les autres addresses qui ont un même plat commun

users[3].email = "sarah@gmail.com"
users[3].first_name = "Sarah"
users[3].last_name = "Mainguy"
users[3].address = "3 rue Rochebrune"
user_4_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot4._zccuac.png")
users[3].image.attach(io: user_4_avatar, filename: 'user4.png', content_type: 'image/png')
users[3].speciality = "Quiche Lorraine"
users[3].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users[4].email = "kenza@gmail.com"
users[4].first_name = "Kenza"
users[4].last_name = "Tighrine"
users[4].address = "29 passage de Ménilmontant"
user_5_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot5_xlr75z.png")
users[4].image.attach(io: user_5_avatar, filename: 'user5.png', content_type: 'image/png')
users[4].speciality = "Quiche Lorraine"
users[4].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users[5].email = "bruno@gmail.com"
users[5].first_name = "Bruno"
users[5].last_name = "Le Lay"
users[5].address = "7 Rue de la Fontaine au Roi"
user_6_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot6_dstbnd.png")
users[5].image.attach(io: user_6_avatar, filename: 'user6.png', content_type: 'image/png')
users[5].speciality = "Quiche Lorraine"
users[5].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users[6].email = "aicha@gmail.com"
users[6].first_name = "Aicha"
users[6].last_name = "Diagne"
users[6].address = "107 avenue Parmentier"
user_7_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot7_eukcbw.png")
users[6].image.attach(io: user_7_avatar, filename: 'user7.png', content_type: 'image/png')
users[6].speciality = "Cuisine végétarienne"
users[6].description = "Venez gouter mes recettes végétariennes gastronomiques! "

users[7].email = "sebastien@gmail.com"
users[7].first_name = "Sebastien"
users[7].last_name = "Saunier"
users[7].address = "1 Rue Saint-Hubert"
user_8_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot8_ywb2np.png")
users[7].image.attach(io: user_8_avatar, filename: 'user8.png', content_type: 'image/png')
users[7].speciality = "Quiche Lorraine"
users[7].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users[8].email = "maria@gmail.com"
users[8].first_name = "Maria"
users[8].last_name = "Leonor"
users[8].address = "20 rue de l'Orillon"
user_9_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot9_dv91qs.png")
users[8].image.attach(io: user_9_avatar, filename: 'user9.png', content_type: 'image/png')
users[8].speciality = "Quiche Lorraine"
users[8].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users[9].email = "etienne@gmail.com"
users[9].first_name = "Etienne"
users[9].last_name = "de Dianous"
users[9].address = "4 Villa Gaudelet"
user_10_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655189785/cuistot10_icg0tz.png")
users[9].image.attach(io: user_10_avatar, filename: 'user10.png', content_type: 'image/png')
users[9].speciality = "Salades de graines"
users[9].description = "Toutes mes salades sont à base de graines germées. Outre leur goût très agréable, elles ont des vertus indéniables pour la santé "

users[10].email = "isabelle@gmail.com"
users[10].first_name = "Isabelle"
users[10].last_name = "Levy"
users[10].address = "3 Rue Saint-Ambroise"
isa_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656610340/isa_dptlqi.png")
users[10].image.attach(io: isa_avatar, filename: 'user11.png', content_type: 'image/png')
users[10].speciality = "Quiche Lorraine"
users[10].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users[11].email = "sophiana@gmail.com"
users[11].first_name = "Sophiana"
users[11].last_name = "B"
users[11].address = "27 avenue de la République"
sophiana_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656610465/sophiana_ewbuyz.jpg")
users[11].image.attach(io: sophiana_avatar, filename: 'user12.png', content_type: 'image/png')
users[11].speciality = "Quiche Lorraine"
users[11].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users[12].email = "ghita@gmail.com"
users[12].first_name = "Ghita"
users[12].last_name = "Aaddaj"
users[12].address = "15 Rue Servan"
ghita_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656610451/ghita_zzfsx0.jpg")
users[12].image.attach(io: ghita_avatar, filename: 'user13.png', content_type: 'image/png')
users[12].speciality = "Quiche Lorraine"
users[12].description = "Je ne sais faire que des quiches, mais elles sont savoureuses! "

users.map(&:save!)

# Seed user account Corentin
client_avatar = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656175247/Capture_d_e%CC%81cran_2022-06-25_a%CC%80_18.40.24_d513bm.png")
client = User.create!(first_name: "Corentin",
                      last_name: "Deseine",
                      address: "16, Villa Gaudelet",
                      city: "Paris",
                      zip_code: 75_011,
                      email: "user@gmail.com",
                      phone_number: "+33601020304",
                      password: "neighborfood")
client.image.attach(io: client_avatar, filename: 'client.png', content_type: 'image/png')
# Seed meal pour Corentin
salade = Meal.create!(name: 'Salade composée',
  description: 'Salade aux crevettes',
  unit_price: 2.5,
  ingredients: "crevettes, avocat, tomates cerise, oignons, roquette, radis",
  range_date_time: "06/14/2022 18:00 , 06/14/2022 22:00",
  available_quantity: 0,
  user_id: client.id)
salade_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656618364/salade_crevette_mdtsx9.png")
salade.image.attach(io: salade_file, filename: 'saladecrevettes.png', content_type: 'image/png')

# Seed meals pour user 1

couscous = Meal.create!(name: 'Couscous',
                        description: 'Le meilleur couscous de Paname !',
                        unit_price: 7.5,
                        ingredients: "semoule, merguez, poulet, courgettes, aubergines, carotte, pois chiches",
                        range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
                        available_quantity: 8,
                        user_id: users[1].id)
couscous_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656448357/couscous_dsh4ke.png")
couscous.image.attach(io: couscous_file, filename: 'couscous.png', content_type: 'image/png')

tajine = Meal.create!(name: "Tajine de poulet",
                      description: 'Comme un retour au Maroc !',
                      unit_price: 6.9,
                      ingredients: "pomme de terre, courgettes, poulet, carottes, oignon, tomates, cumin",
                      range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
                      available_quantity: 8,
                      user_id: users[1].id)
tajine_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655037823/tajine-removebg-preview_z0onqs.png")
tajine.image.attach(io: tajine_file, filename: 'Tajine.png', content_type: 'image/png')

pastilla = Meal.create!(name: 'Pastilla',
                        description: 'Mon plat le plus apprécié de tous !',
                        unit_price: 4.5,
                        ingredients: "poulet, amandes, oignons, pignon, feuilles de brick, persil",
                        range_date_time: "06/14/2022 17:00 , 06/14/2022 19:00",
                        available_quantity: 5,
                        user_id: users[1].id)
pastilla_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656448337/pastilla_ypthey.png")
pastilla.image.attach(io: pastilla_file, filename: 'Pastilla.png', content_type: 'image/png')

# Seed meals pour user 2
tartare_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656500720/Tartare-thon_j1ufi0.png")
tartare = Meal.create!(name: 'Tartare de thon',
                       description: "Tartare de thon frais façon créole. Mes amis et ma famille se régalent à chaque bouchée de ce plat ! J'espère qu'il sera vous satisfaire ",
                       unit_price: 8,
                       ingredients: "thon frais, capres, oignons, huile d'olive, sauce créoline ",
                       range_date_time: "['06/14/2022 17:00' , '06/14/2022 19:00']",
                       available_quantity: 4,
                       user_id: users[0].id)
tartare.image.attach(io: tartare_file, filename: 'Tartare-thon.png', content_type: 'image/png')

tataki = Meal.create!(name: 'Tataki de thon',
                      description: "Un tataki de thon frais avec du guacamole et une délicieuse salade d'ananas",
                      unit_price: 9.5,
                      ingredients: "thon, avocat, ananas, poivron, piment doux, citron vert, persil, huile d'olive ",
                      range_date_time: "06/14/2022 20:00 , 06/14/2022 22:00",
                      available_quantity: 6,
                      user_id: users[0].id)
tataki_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656500773/Tataki-thon_biymqi.png")
tataki.image.attach(io: tataki_file, filename: 'Tataki-thon.png', content_type: 'image/png')

clafoutis = Meal.create!(name: 'Clafoutis',
                        description: "Clafoutis aux Cerises",
                        unit_price: 3,
                        ingredients: "farine, lait, beurre, oeufs, cerises ",
                        range_date_time: "06/14/2022 20:00 , 06/14/2022 22:00",
                        available_quantity: 6,
                        user_id: users[0].id)
clafoutis_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1656676243/clafoutis_bsjibh.png")
clafoutis.image.attach(io: clafoutis_file, filename: 'clafoutis.png', content_type: 'image/png')
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
               unit_price: rand(3..6),
               ingredients: "pâte brisée, lardons, oeufs, crème fraîche",
               range_date_time: "06/14/2022 18:00 , 06/14/2022 22:00",
               available_quantity: rand(2..6),
               user_id: user.id)
others_users_file = URI.open("https://res.cloudinary.com/dj1mlcnes/image/upload/v1655243158/quiche-removebg-preview_fqgtbe.png")
quiche.image.attach(io: others_users_file, filename: 'quiche.png', content_type: 'image/png')
end

# Seed orders

# Order 1 - User

order1 = Order.create!(client_id: client.id,
                       cooker_id: User.find_by(first_name: "Ghita").id,
                       delivery_date_time: "Vendredi 10 Juin 2022 18H00",
                       status: 1)
OrderDetail.create!(order_id: order1.id,
                    meal_id: tataki.id,
                    ordered_quantity: 2)

# Order 2 - User

order2 = Order.create!(client_id: client.id,
                       cooker_id: User.find_by(first_name: "Kenza").id,
                       delivery_date_time: "Samedi 11 Juin 2022 18H00",
                       status: 1)
OrderDetail.create!(order_id: order2.id,
                    meal_id: tartare.id,
                    ordered_quantity: 1)

# Order 3 - User
order3 = Order.create!(client_id: client.id,
                       cooker_id: User.find_by(first_name: "Isabelle").id,
                       delivery_date_time: "Lundi 13 Juin 2022 17H00",
                       status: 1)

OrderDetail.create!(order_id: order3.id,
                    meal_id: couscous.id,
                    ordered_quantity: 1)

# Order 4 - Cuistot pour Ibra

order4 = Order.create!(client_id: User.find_by(first_name: "Mohamed").id,
                       cooker_id: User.find_by(first_name: "Ibrahima").id,
                       delivery_date_time: "Lundi 13 Juin 2022 17H00",
                       status: 1)

OrderDetail.create!(order_id: order4.id,
                    meal_id: tataki.id,
                    ordered_quantity: 1)

# Order 5 - Cuistot pour Ibra

order5 = Order.create!(client_id: User.find_by(first_name: "Sarah").id,
                       cooker_id: User.find_by(first_name: "Ibrahima").id,
                       delivery_date_time: "Lundi 13 Juin 2022 17H00",
                       status: 1)
OrderDetail.create!(order_id: order5.id,
                    meal_id: tataki.id,
                    ordered_quantity: 4)

# Order 6 - Cuistot pour Boris

order6 = Order.create!(client_id: User.find_by(first_name: "Mohamed").id,
                       cooker_id: User.find_by(first_name: "Boris").id,
                       delivery_date_time: "Lundi 13 Juin 2022 17H00",
                       status: 1)
OrderDetail.create!(order_id: order6.id,
                    meal_id: couscous.id,
                    ordered_quantity: 4)

# Order 7 - Cuistot pour Boris

order7 = Order.create!(client_id: User.find_by(first_name: "Sarah").id,
                       cooker_id: User.find_by(first_name: "Boris").id,
                       delivery_date_time: "Lundi 13 Juin 2022 17H00",
                       status: 1)
OrderDetail.create!(order_id: order7.id,
                    meal_id: couscous.id,
                    ordered_quantity: 4)

# Reviews pour Boris
Review.create!(user_id: User.find_by(first_name: "Sophiana").id,
               cooker_id: User.find_by(first_name: "Boris").id,
               rating: 4,
               content: "Très bon couscous ! Boris est un cuistot très sympathique et ses plats sont très savoureux")

Review.create!(user_id: User.find_by(first_name: "Bruno").id,
               cooker_id: User.find_by(first_name: "Boris").id,
               rating: 5,
               content: " J'adore les pastilas de Boris ! Un délice ! Je recommande fortement")

Review.create!(user_id: User.find_by(first_name: "Ghita").id,
               cooker_id: User.find_by(first_name: "Boris").id,
               rating: 5,
               content: " Très très bon ! ")

Review.create!(user_id: User.find_by(first_name: "Maria").id,
               cooker_id: User.find_by(first_name: "Boris").id,
               rating: 5,
               content: " J'adore j'adore j'adore !!! ")

# Reviews pour Ibrahima

Review.create!(user_id: User.find_by(first_name: "Mohamed").id,
               cooker_id: User.find_by(first_name: "Ibrahima").id,
               rating: 5,
               content: "Tout simplement les meilleurs poissons de Paris ! Ibrahima est un cuistot qui sait vous
               accueillir et vous fera découvrir ses spécialités")

Review.create!(user_id: User.find_by(first_name: "Bruno").id,
               cooker_id: User.find_by(first_name: "Ibrahima").id,
               rating: 5,
               content: "INCROYABLE ! C'est le seul mot que j'ai trouvé pour décrire les plat proposés par Ibrahima")
