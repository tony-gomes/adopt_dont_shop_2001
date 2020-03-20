# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.destroy_all

shelter_1 = Shelter.create(name: "Doggie Dog World",
                           address: "123 Main St.",
                           city: "Denver",
                           state: "CO",
                           zip: "80202")
shelter_2 = Shelter.create(name: "Doggie Day",
                           address: "987 Spring Lake",
                           city: "Denver",
                           state: "CO",
                           zip: "80212")
shelter_3 = Shelter.create(name: "Dog Lovers",
                           address: "456 Rocky Road",
                           city: "Lala Land",
                           state: "North Nowhere",
                           zip: "90210")
