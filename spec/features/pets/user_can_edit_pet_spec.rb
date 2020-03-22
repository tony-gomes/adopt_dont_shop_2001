require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can edit a pet" do
    shelter_3 = Shelter.create(name: "Dogtopia",
                               address: "456 Rocky Road",
                               city: "Lala Land",
                               state: "North Nowhere",
                               zip: "90210")

    pet_3 = shelter_3.pets.create(profile_img: "https://via.placeholder.com/300",
                                  name: "Boudicca",
                                  description: "Phasellus quis pretium lorem. Nulla facilisi. Phasellus imperdiet tellus odio, auctor sollicitudin ipsum congue a. Aenean arcu erat, congue eget nulla eu, pulvinar semper ligula. Duis a eros metus. Integer at urna ut ligula tristique pretium eu eget augue.",
                                  approximate_age: 1,
                                  sex: "Female",
                                  adoption_status: "Adoptable",
                                  current_shelter: "Dogtopia")

    visit "/pets/#{pet_3.id}"

    click_on 'Update Pet'

    fill_in :profile_img, with: "https://via.placeholder.com/300"
    fill_in :name, with: "Boudicca"
    fill_in :description, with: "Nam at sapien purus. Donec in lacus neque. Nam mattis nunc nec erat suscipit blandit. Ut id fermentum diam. Praesent bibendum, nunc eget efficitur venenatis, diam nunc porttitor felis, pellentesque maximus tellus arcu sed leo."
    fill_in :approximate_age, with: 1.5
    choose("Female")

    click_on "Submit"

    # expect(:profile_img).to eq("https://via.placeholder.com/300")
    # expect(:name).to eq("Boudicca")
    # expext(page).to have_content(pet_3.description)
    # expect(:approximate_age).to eq(1.5)
    # expect(:sex).to eq("Female")
  end
end
