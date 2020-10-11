require 'rails_helper'

describe "pet index page" do
  it "should visit pets" do
    visit '/pets'
  end

  it "should have a header" do
    visit '/pets'
    expect(page).to have_content('All Pets')
  end

  it "should have pets info" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    pet1 = Pet.create(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg', name: "maximalin", age: 4, sex: "male", status: "Adoptable", description: "brave", shelter_id: shelter1.id )
    visit '/pets'

    expect(page).to have_xpath("//img[contains(@src,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg')]")
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
  end
end
