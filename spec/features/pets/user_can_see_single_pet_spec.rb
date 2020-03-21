require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see single pet" do
    pet_1 = Pet.create(profile_img: "https://via.placeholder.com/300",
                       name: "Athena",
                       description: "Proin et nisi tempus, pharetra nunc sit amet, vulputate nisl. Aenean ornare convallis posuere. Curabitur in elit vitae risus ultrices hendrerit et id orci. Curabitur nec sagittis risus, id rhoncus eros. Nullam sagittis pellentesque suscipit. Ut ornare aliquet metus. Cras porta nec mauris vitae lobortis.",
                       approximate_age: 8,
                       sex: "Nah",
                       adoption_status: "Deeply Loved",
                       current_shelter_id: 1)
    pet_2 = Pet.create(profile_img: "https://via.placeholder.com/300",
                       name: "Delphi",
                       description: "Pellentesque accumsan faucibus elementum. Vivamus a faucibus enim. Donec fermentum tristique neque ac mollis. Pellentesque ullamcorper, ante sed ornare lacinia, augue leo congue eros, sed lacinia velit nibh at dolor. Aliquam suscipit purus id est tempus, at accumsan risus pulvinar.",
                       approximate_age: 4,
                       sex: "Nope",
                       adoption_status: "Loved Deeply",
                       current_shelter_id: 2)

    visit "/pets/#{pet_2.id}"

    page.has_css?("img[src*='https://via.placeholder.com/150']")
    expect(pet_2.name).to eq("Delphi")
    expect(page).to have_content(pet_2.description)
    expect(pet_2.approximate_age).to eq("4")
    expect(pet_2.sex).to eq("Nope")
    expect(pet_2.adoption_status).to eq("Loved Deeply")

    expect(page).to have_no_content(pet_1.name)
    expect(page).to have_no_content(pet_1.description)
    expect(page).to have_no_content(pet_1.approximate_age)
    expect(page).to have_no_content(pet_1.sex)
    expect(page).to have_no_content(pet_1.adoption_status)
  end
end
