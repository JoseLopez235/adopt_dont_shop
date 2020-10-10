class PetsController < ApplicationController
  def index
    @shelter = Shelter.all
    @pets = Pet.all
  end

  def id
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    new_pet = Pet.find(params[:id])
    new_pet.update ({
      image: params[:pet][:image],
      name: params[:pet][:name],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      description: params[:pet][:description],
      status: params[:pet][:status],
      shelter_id: params[:pet][:shelter_id]
      })

    redirect_to "/pets/#{new_pet.id}"
  end

  def delete
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end
end
