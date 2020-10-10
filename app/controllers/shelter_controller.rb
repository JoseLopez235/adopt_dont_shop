class ShelterController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })

    shelter.save

    redirect_to '/shelters'
  end

  def id
    @shelters = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update ({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })

    shelter.save
    redirect_to '/shelters'
  end

  def delete
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def pets
    @shelter = Shelter.find(params[:shelter_id])
    shelter_id = params[:shelter_id]
    @pets = Pet.all.where("shelter_id = #{shelter_id}")
  end

  def new_pet
  end

  def create_pet
    pet = Pet.new(
      image: params[:pet][:image],
      name: params[:pet][:name],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      status: params[:pet][:status],
      description: params[:pet][:description],
      shelter_id: params[:pet][:shelter_id]
    )

    pet.save

    redirect_to "/shelters/#{(params[:pet][:shelter_id]).to_i}/pets"
  end

  
end
