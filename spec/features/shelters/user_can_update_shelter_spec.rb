require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can update shelter name, address, city, state, zip" do
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

    visit "/shelters/#{shelter_1.id}"

    click_on "Update Shelter"

    visit "/shelters/#{shelter_1.id}/edit"

    fill_in :name, with: "Dog Gon'it Doggies"
    fill_in :address, with: "567 Lake Street"
    fill_in :city, with: "NoMoreCorona"
    fill_in :state, with: "FL"
    fill_in :zip, with: "33433"

    click_on "Submit"

    expect(page).to have_content("Dog Gon'it Doggies")
    expect(page).to have_content("567 Lake Street")
    expect(page).to have_content("NoMoreCorona")
    expect(page).to have_content("FL")
    expect(page).to have_content("33433")

    expect(page).to have_no_content("Doggie Dog World")
    expect(page).to have_no_content("123 Main St.")
    expect(page).to have_no_content("Denver")
    expect(page).to have_no_content("CO")
    expect(page).to have_no_content("80202")

    # layout tests
    find_link("Pets", id: :nav_right_pets, href: "/pets").visible?
    find_link("Shelters", id: :nav_right_shelters, href: "/shelters").visible?
  end
end
