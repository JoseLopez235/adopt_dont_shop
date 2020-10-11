require 'rails_helper'

describe "shelter index page" do
  it "should visit shelter" do
    visit '/shelters'
  end

  it "should contain name of shelters" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    shelter2 = Shelter.create(name: "Max's Shelter", address: "456 n lamd blvd", city: "Mssr", state: "Kasae", zip: "22321")
    visit '/shelters'
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end

  it "should have link that leads to shelter new" do
    visit "/shelters"
    expect(page).to have_selector(:css, 'a[href="/shelters/new"]')
  end

  it "should have link that leads to the shelter info page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters"
    expect(page).to have_link(nil, href: "/shelters/#{shelter1.id}")
  end

  it "should have link that leads to the shelter update page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters"
    expect(page).to have_link(nil, href: "/shelters/#{shelter1.id}/edit")
  end

  it "should have link that leads to the shelter update page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters"
    expect(page).to have_link(nil, href: "/shelters/#{shelter1.id}/edit")
  end

  it "should have links that lead to shelters and pets index page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters"

    expect(page).to have_link(nil, href: "/pets")
  end
end
