require 'rails_helper'

feature 'Cats have toys' do

  scenario 'users can view cats' do

    cat = Cat.create!(name: "Fluffy")
    toy = Toy.create!(name: "Squiggles", cat_id: cat.id)

    visit root_path
    expect(page).to have_no_content("Cats!")

    visit cats_path
    click_on "Cats"
    expect(page).to have_content("Cats!")
    expect(page).to have_content("Fluffy")
    
    click_on "Fluffy"
    expect(page).to have_content("Squiggles")
    expect(page).to have_content("Fluffy")

  end

end
