# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
OrderDetail.destroy_all
Order.destroy_all
Meal.destroy_all
User.destroy_all


2.times do
  user = User.create!(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    city: "Paris", zip_code:75011,
    email: Faker::Internet.email,
    phone_number:"+33601020304",
    password:"neighborfood")



end



end
  user1 = User.first
  user1.address = "83 Rue Jean-Pierre Timbaud"
  user1.save!
  user2 = User.last
  user2.address = "148 Rue Oberkampf"
  user2.save!

# 83 Rue Jean-Pierre Timbaud, 75011 Paris
# 148 Rue Oberkampf, 75011 Paris
# Rue Saint-Hubert, 75011 Paris
# 30 Rue Moret, 75011 Paris
# 10 Rue des Nanettes, 75011 Paris
# 7 Rue de la Fontaine au Roi, 75011 Paris
# 83 Bd de Ménilmontant, 75011 Paris
# 18 Rue des Bluets, 75011 Paris




# t.string "name"
  # t.text "description"
  # t.float "unit_price"
  # t.text "ingredients"
  # t.string "range_date_time"
  # t.integer "available_quantity"
  # t.bigint "user_id", null: false
  # t.datetime "created_at", precision: 6, null: false
  # t.datetime "updated_at", precision: 6, null: false
  # t.index ["user_id"], name: "index_meals_on_user_id"
