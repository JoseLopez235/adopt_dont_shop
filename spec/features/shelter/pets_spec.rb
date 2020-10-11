require 'rails_helper'

describe "shelter pets page" do
  it "should visit shelter/id/pets" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters/#{shelter1.id}/pets"
  end

  it "should have a button to add a new pet" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}/pets"
    click_button 'Add Pet'
    expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new")
  end

  it "should have pet info" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )
    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_xpath("//img[contains(@src,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg')]")
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
  end

  it "should have a link that leads users to pet info page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )
    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_link(nil, href: "/pets/#{pet1.id}")
  end
end
