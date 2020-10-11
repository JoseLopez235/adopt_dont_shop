require 'rails_helper'

describe "shelter id page" do
  it "should visit shelter/id" do
      shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters/#{shelter1.id}"
  end

  it "should have shelter name as a header" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}"
    expect(page).to have_content(shelter1.name)
  end

  it "should have shelter id with address" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_content(shelter1.id)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)
  end

  it "should have link that leads to all shelters pets" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}"
    expect(page).to have_link(nil, href: "/shelters/#{shelter1.id}/pets")
  end

  it "should have a button that returns you to the shelter page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}"
    click_button

   expect(current_path).to eq('/shelters')
  end

  it "should have links that lead to shelters and pets index page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}/edit"

    expect(page).to have_link(nil, href: "/shelters")
    expect(page).to have_link(nil, href: "/pets")
  end
end
