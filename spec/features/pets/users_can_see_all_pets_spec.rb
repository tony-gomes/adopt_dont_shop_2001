require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see all pets names when I visit /pets" do
    shelter_1 = Shelter.create(name: "Doggie Dog World",
                               address: "123 Main St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80202")

    pet_1 = shelter_1.pets.create(profile_img: "https://via.placeholder.com/300",
                                  name: "Athena",
                                  description: "Proin et nisi tempus, pharetra nunc sit amet, vulputate nisl. Aenean ornare convallis posuere. Curabitur in elit vitae risus ultrices hendrerit et id orci. Curabitur nec sagittis risus, id rhoncus eros. Nullam sagittis pellentesque suscipit. Ut ornare aliquet metus. Cras porta nec mauris vitae lobortis.",
                                  approximate_age: 8,
                                  sex: "Nah",
                                  adoption_status: "Deeply Loved",
                                  current_shelter: "Doggie Dog World")

    pet_2 = shelter_1.pets.create(profile_img: "https://via.placeholder.com/300",
                                  name: "Delphi",
                                  description: "Pellentesque accumsan faucibus elementum. Vivamus a faucibus enim. Donec fermentum tristique neque ac mollis. Pellentesque ullamcorper, ante sed ornare lacinia, augue leo congue eros, sed lacinia velit nibh at dolor. Aliquam suscipit purus id est tempus, at accumsan risus pulvinar.",
                                  approximate_age: 4,
                                  sex: "Nope",
                                  adoption_status: "Loved Deeply",
                                  current_shelter: "Doggie Dog World")

    visit "/pets"

    page.has_css?("img[src*='https://via.placeholder.com/150']")
    expect(page).to have_link(pet_1.name, href: "/pets/#{pet_1.id}")
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.current_shelter)
    expect(page).to have_link(pet_1.current_shelter, href: "/shelters/#{pet_1.shelter_id}")
    expect(page).to have_link(nil, href: "/pets/#{pet_1.id}/edit")
    find_link("Delete", href: "/pets/#{pet_1.id}").visible?

    page.has_css?("img[src*='https://via.placeholder.com/150']")
    expect(page).to have_link(pet_2.name, href: "/pets/#{pet_2.id}")
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content(pet_2.current_shelter)
    expect(page).to have_link(pet_2.current_shelter, href: "/shelters/#{pet_2.shelter_id}")
    expect(page).to have_link(nil, href: "/pets/#{pet_2.id}/edit")
    find_link("Delete", href: "/pets/#{pet_2.id}").visible?

    # layout tests
    find_link("Pets", id: :nav_right_pets, href: "/pets").visible?
    find_link("Shelters", id: :nav_right_shelters, href: "/shelters").visible?
  end
end
