require 'rails_helper'

describe "shelter edit page" do
  it "should visit shelters/:id/edit" do
      shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters/#{shelter1.id}/edit"
  end

  it "should have a form" do
      shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")
    visit "/shelters/#{shelter1.id}/edit"
    fill_in 'shelter[name]', with: 'Dog and Cats'
    fill_in 'shelter[address]', with: '1234 spoon.st'
    fill_in 'shelter[city]', with: 'Tampa'
    fill_in 'shelter[state]', with:   'Florida'
    fill_in 'shelter[zip]', with: '34638'

    click_button 'Update Shelter'
    expect(page).to have_content('Dog and Cats')
    expect(page).to have_content('1234 spoon.st')
    expect(page).to have_content('Tampa')
    expect(page).to have_content('Florida')
    expect(page).to have_content('34638')
    expect(current_path).to eq('/shelters')
  end
end
