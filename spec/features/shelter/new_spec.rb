require 'rails_helper'

describe "shelter new page" do
  it "should visit shelter/new" do
    visit '/shelters/new'
  end

  it "should have a form" do
    visit '/shelters/new'
    fill_in 'shelter[name]', with: 'Dog and Cats'
    fill_in 'shelter[address]', with: '1234 spoon.st'
    fill_in 'shelter[city]', with: 'Tampa'
    fill_in 'shelter[state]', with: 'Florida'
    fill_in 'shelter[zip]', with: '34638'

    click_button 'Create Shelter'
    expect(page).to have_content('Dog and Cats')
    expect(page).to have_content('1234 spoon.st')
    expect(page).to have_content('Tampa')
    expect(page).to have_content('Florida')
    expect(page).to have_content('34638')
    expect(current_path).to eq('/shelters')
  end

  it "should have links that lead to shelters and pets index page" do
    shelter1 = Shelter.create(name: "Bob's Shelter", address: "123 s lori ave", city: "Mark", state: "Kane", zip: "25631")

    visit '/shelters/new'

    expect(page).to have_link(nil, href: "/shelters")
    expect(page).to have_link(nil, href: "/pets")
  end
end
