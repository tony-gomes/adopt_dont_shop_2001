require 'rails_helper'

RSpec.describe "roots to welcome page w/ links", type: :feature do
  it "can see welcome#index" do

    visit "/"

    page.has_css?(".welcome_message")
    expect(page).to have_link("All Shelters", href: "/shelters")
    expect(page).to have_link("Add Shelter", href: "/shelters/new")
  end
end
