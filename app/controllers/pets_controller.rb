class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    edit_pet = Pet.find(params[:id])
    edit_pet.update(edit_pet_params)
    edit_pet.save!
    redirect_to "/pets/#{edit_pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private

  def edit_pet_params
    params.permit(:profile_img, :name, :description, :approximate_age, :sex)
  end
end
