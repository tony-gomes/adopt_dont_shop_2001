require 'rails_helper'

RSpec.describe "as a visitor" do
  it "I can create a new Shelter from the Shelter Index Page" do
    visit '/shelters'

    click_on "New Shelter"

    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: "Dogtopia"
    fill_in :address, with: "001 Main Street"
    fill_in :city, with: "Deerfield Beach"
    fill_in :state, with: "FL"
    fill_in :zip, with: "33432"

    click_on "Create Shelter"

    new_shelter = Shelter.last

    expect(current_path).to eq("/shelters/#{new_shelter.id}")
    expect(new_shelter.name).to eq("Dogtopia")
    expect(page).to have_content("Dogtopia")
  end
end
