require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I get rooted to /" do

    visit "/"

    page.has_css?(".welcome_message")
    expect(page).to have_link("All Shelters", href: "/shelters")
    expect(page).to have_link("Add Shelter", href: "/shelters/new")
  end
end
