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
shelter_3 = Shelter.create(name: "Dogtopia",
                           address: "456 Rocky Road",
                           city: "Lala Land",
                           state: "North Nowhere",
                           zip: "90210")

pet_1 = shelter_1.pets.create(profile_img: "https://via.placeholder.com/300",
                   name: "Xanthippe",
                   description: "Proin et nisi tempus, pharetra nunc sit amet, vulputate nisl. Aenean ornare convallis posuere. Curabitur in elit vitae risus ultrices hendrerit et id orci. Curabitur nec sagittis risus, id rhoncus eros. Nullam sagittis pellentesque suscipit. Ut ornare aliquet metus. Cras porta nec mauris vitae lobortis.",
                   approximate_age: 8,
                   sex: "Female",
                   adoption_status: "Adoptable",
                   current_shelter: "Doggie Dog World")
pet_2 = shelter_1.pets.create(profile_img: "https://via.placeholder.com/300",
                   name: "Hypatia",
                   description: "Pellentesque accumsan faucibus elementum. Vivamus a faucibus enim. Donec fermentum tristique neque ac mollis. Pellentesque ullamcorper, ante sed ornare lacinia, augue leo congue eros, sed lacinia velit nibh at dolor. Aliquam suscipit purus id est tempus, at accumsan risus pulvinar.",
                   approximate_age: 4,
                   sex: "Female",
                   adoption_status: "Adoptable",
                   current_shelter: "Doggie Dog World")
pet_3 = shelter_3.pets.create(profile_img: "https://via.placeholder.com/300",
                   name: "Boudicca",
                   description: "Phasellus quis pretium lorem. Nulla facilisi. Phasellus imperdiet tellus odio, auctor sollicitudin ipsum congue a. Aenean arcu erat, congue eget nulla eu, pulvinar semper ligula. Duis a eros metus. Integer at urna ut ligula tristique pretium eu eget augue.",
                   approximate_age: 1,
                   sex: "Female",
                   adoption_status: "Adoptable",
                   current_shelter: "Dogtopia")
