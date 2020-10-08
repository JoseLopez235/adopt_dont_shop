class PetsController < ApplicationController
  def index
    @pet = ["https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg", "Max", "3", "Male", "Mommi"]
  end
end
