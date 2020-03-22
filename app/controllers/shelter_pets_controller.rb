class ShelterPetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:shelter_id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)
    pet.current_shelter = shelter.name
    pet.adoption_status = "Adoptable"
    pet.save!
    redirect_to "/pets/#{pet.id}"
  end

  private

  def pet_params
    params.permit(:profile_img, :name, :description, :approximate_age, :sex)
  end
end
