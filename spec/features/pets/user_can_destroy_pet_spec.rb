require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can destroy a pet" do
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

    visit '/pets'
    expect(page).to have_content(pet_3.name)

    visit "/pets/#{pet_3.id}"

    click_on "Delete"

    expect(current_path).to eq("/pets")
    expect(page).to have_no_content(pet_3.name)

    # layout tests
    find_link("Pets", id: :nav_right_pets, href: "/pets").visible?
  end
end
