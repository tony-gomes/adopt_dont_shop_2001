class SheltersController < ApplicationController
  def index
    @shelters = Shelters.all
  end
end
