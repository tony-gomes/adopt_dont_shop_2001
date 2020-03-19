require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can destroy a shelter" do
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

    visit '/shelters'
    expect(page).to have_content(shelter_1.name)

    visit '/shelters/#{shelter_1.id}'

    click_on "Delete"

    expect(current_path).to eq("/shelters")
    expect(page).to have_no_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
