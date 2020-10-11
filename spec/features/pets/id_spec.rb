require 'rails_helper'

describe "pet id page" do
  it "should visit pets/id" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )
    visit "/pets/#{pet1.id}"
  end

  it "should have the pets name as a header" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )

    visit "/pets/#{pet1.id}"
    expect(page).to have_content(pet1.name)
  end

  it "should have pets info" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )

    visit "/pets/#{pet1.id}"

    expect(page).to have_xpath("//img[contains(@src,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg')]")
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.status)
    expect(page).to have_content(pet1.description)
  end

  it "should have a delete link" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )

    visit "/pets/#{pet1.id}"
    expect(page).to have_link(nil, href: "/pets/#{pet1.id}")
  end

  it "should have a button to edit pets info" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )

    visit "/pets/#{pet1.id}"
    click_button

   expect(current_path).to eq("/pets/#{pet1.id}/edit")
  end

  it "should have links that lead to shelters and pets index page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )
    visit "/pets/#{pet1.id}"

    expect(page).to have_link(nil, href: "/shelters")
    expect(page).to have_link(nil, href: "/pets")
  end
end
