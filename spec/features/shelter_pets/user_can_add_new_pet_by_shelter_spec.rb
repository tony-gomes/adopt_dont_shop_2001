require 'rails_helper'

RSpec.describe "as a visitor" do
  it "I can create new pet by shelter" do
    shelter_1 = Shelter.create(name: "Dogtopia")

    pet_image = "https://via.placeholder.com/300"
    pet_name = "Boudicca"
    pet_description = "Phasellus quis pretium lorem. Nulla facilisi. Phasellus imperdiet tellus odio, auctor sollicitudin ipsum congue a. Aenean arcu erat, congue eget nulla eu, pulvinar semper ligula. Duis a eros metus. Integer at urna ut ligula tristique pretium eu eget augue."
    pet_approximate_age = 1
    pet_adoption_status = "Adoptable"
    pet_current_shelter = "Dogtopia"

    visit "/shelters/#{shelter_1.id}/pets/new"

    fill_in :profile_img, with: pet_image
    fill_in :name, with: pet_name
    fill_in :description, with: pet_description
    fill_in :approximate_age, with: pet_approximate_age
    choose("Female")

    click_on "Create Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/pets/#{new_pet.id}")
    page.has_css?("img[src*='https://via.placeholder.com/300']")
    expect(new_pet.name).to eq("Boudicca")
    expect(page).to have_content(pet_description)
    expect(new_pet.approximate_age).to eq("1")
    expect(new_pet.sex).to eq("female")
    expect(new_pet.adoption_status).to eq(new_pet.adoption_status)

    # layout tests
    find_link("Pets", id: :nav_right_pets, href: "/pets").visible?
    find_link("Shelters", id: :nav_right_shelters, href: "/shelters").visible?
  end
end
