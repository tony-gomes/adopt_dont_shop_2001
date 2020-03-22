require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see all shelters names when I visit /shelters" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_link(nil, href: "/shelters/#{shelter_1.id}/edit")
    find_link("Delete", href: "/shelters/#{shelter_1.id}").visible?

    expect(page).to have_content(shelter_2.name)
    expect(page).to have_link(nil, href: "/shelters/#{shelter_2.id}/edit")
    find_link("Delete", href: "/shelters/#{shelter_2.id}").visible?

    expect(page).to have_content(shelter_3.name)
    expect(page).to have_link(nil, href: "/shelters/#{shelter_3.id}/edit")
    find_link("Delete", href: "/shelters/#{shelter_3.id}").visible?
  end
end
