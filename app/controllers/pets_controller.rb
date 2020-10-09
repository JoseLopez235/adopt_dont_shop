class PetsController < ApplicationController
  def index
    @shelter = Shelter.all
    @pets = Pet.all
  end

  def id
    @pet = Pet.find(params[:id])
  end
end
