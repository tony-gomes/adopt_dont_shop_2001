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

pet_1 = Pet.create(profile_img: "https://via.placeholder.com/300",
                   name: "Athena",
                   description: "Proin et nisi tempus, pharetra nunc sit amet, vulputate nisl. Aenean ornare convallis posuere. Curabitur in elit vitae risus ultrices hendrerit et id orci. Curabitur nec sagittis risus, id rhoncus eros. Nullam sagittis pellentesque suscipit. Ut ornare aliquet metus. Cras porta nec mauris vitae lobortis.",
                   approximate_age: 8,
                   sex: "Nah",
                   adoption_status: "Deeply Loved",
                   current_shelter_id: 1)
pet_2 = Pet.create(profile_img: "https://via.placeholder.com/300",
                   name: "Delphi",
                   description: "Pellentesque accumsan faucibus elementum. Vivamus a faucibus enim. Donec fermentum tristique neque ac mollis. Pellentesque ullamcorper, ante sed ornare lacinia, augue leo congue eros, sed lacinia velit nibh at dolor. Aliquam suscipit purus id est tempus, at accumsan risus pulvinar.",
                   approximate_age: 4,
                   sex: "Nope",
                   adoption_status: "Loved Deeply",
                   current_shelter_id: 2)
