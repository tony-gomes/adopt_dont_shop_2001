class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new; end

  def create
    new_shelter = Shelter.create(new_shelter_id)
    redirect_to "/shelters/#{new_shelter.id}"
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    edit_shelter = Shelter.find(params[:id])
    edit_shelter.update(edit_shelter_params)
    edit_shelter.save
    redirect_to "/shelters/#{edit_shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  private

  def new_shelter_id
    params.permit(:name)
  end

  def edit_shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
