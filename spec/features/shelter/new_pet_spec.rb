require 'rails_helper'

describe "shelter pets page" do
  it "should visit shelters/id/pets" do
      shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters/#{shelter1.id}/pets"
  end

  it "should have a form" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}/pets/new"

    fill_in 'pet[image]', with: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg"
    fill_in 'pet[name]', with: 'mark'
    fill_in 'pet[age]', with: '3'
    fill_in 'pet[sex]', with: 'male'
    fill_in 'pet[description]', with: 'cute'


    click_button 'Create Pet'

    expect(page).to have_xpath("//img[contains(@src,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/American_Eskimo_Dog.jpg/1200px-American_Eskimo_Dog.jpg')]")
    expect(page).to have_content('mark')
    expect(page).to have_content('3')
    expect(page).to have_content('male')
    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
  end

  it "should have links that lead to shelters and pets index page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit "/shelters/#{shelter1.id}/pets/new"

    expect(page).to have_link(nil, href: "/shelters")
    expect(page).to have_link(nil, href: "/pets")
  end
end
