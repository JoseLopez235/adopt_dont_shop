require 'rails_helper'

describe "pet edit page" do
  it "should visit pets/id/edit" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )
    visit "/pets/#{pet1.id}/edit"
  end

  it "should have a header with image" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )
    visit "/pets/#{pet1.id}/edit"

    expect(page).to have_content("#{pet1.name}'s Info")
    expect(page).to have_xpath("//img[contains(@src,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg')]")
  end

  it "should have a form" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )

    visit "/pets/#{pet1.id}/edit"

    fill_in 'pet[image]', with: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg"
    fill_in 'pet[name]', with: 'mark'
    fill_in 'pet[age]', with: '3'
    fill_in 'pet[sex]', with: 'male'
    fill_in 'pet[description]', with: 'cute'


    click_button 'Update Pet'

    expect(page).to have_xpath("//img[contains(@src,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg')]")
    expect(page).to have_content('mark')
    expect(page).to have_content('3')
    expect(page).to have_content('male')
    expect(current_path).to eq("/pets/#{pet1.id}")
  end
end
