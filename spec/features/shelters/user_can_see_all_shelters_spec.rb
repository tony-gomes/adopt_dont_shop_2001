require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)
  end
end
