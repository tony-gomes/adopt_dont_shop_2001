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

  private

  def new_shelter_id
    params.permit(:name)
  end
end
