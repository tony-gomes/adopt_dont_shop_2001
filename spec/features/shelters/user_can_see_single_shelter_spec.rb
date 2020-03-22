require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see single shelter name, address, city, state, zip" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
    find_link("See Our Pets",  href: "/shelters/#{shelter_1.id}/pets").visible?

    expect(page).to have_no_content(shelter_2.name)
    expect(page).to have_no_content(shelter_3.name)

    # layout tests
    find_link("Pets", id: :nav_right_pets, href: "/pets").visible?
    find_link("Shelters", id: :nav_right_shelters, href: "/shelters").visible?
  end
end
