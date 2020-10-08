class PetsController < ApplicationController
  def index
    @pets = [pet1 = {img: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg", name: "Max", age: "3", sex: "Male", shelter: "Mommi"}]
  end
end
