require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see all pets names when I visit /pets" do
    pet_1 = Pet.create(profile_img: "https://via.placeholder.com/150",
                       name: "Athena",
                       approximate_age: 8,
                       sex: "Nah",
                       current_shelter_id: 1)
    pet_2 = Pet.create(profile_img: "https://via.placeholder.com/150",
                       name: "Delphi",
                       approximate_age: 4,
                       sex: "Nope",
                       current_shelter_id: 2)

    visit "/pets"

    page.has_css?("img[src*='https://via.placeholder.com/150']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.current_shelter_id)

    page.has_css?("img[src*='https://via.placeholder.com/150']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content(pet_2.current_shelter_id)
  end
end
