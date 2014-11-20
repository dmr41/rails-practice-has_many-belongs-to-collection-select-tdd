require 'rails_helper'


feature "Toys" do

  # before(:each) do
  #   cat = Cat.create!(name: "Fluffy")
  #   toy = Toy.create!(name: "Squiggles", cat_id: cat.id)
  # end

  scenario "Toys page lists cat that owns toy" do

    cat = Cat.create!(name: "Fluffy")
    toy = Toy.create!(name: "Squiggles", cat_id: cat.id)

    visit toys_path

    expect(page).to have_content("Fluffy")
    expect(page).to have_content("Squiggles")

  end

  scenario "Toys page lists cat and directs to toy show page" do

    cat = Cat.create!(name: "Fluffy")
    toy = Toy.create!(name: "Squiggles", cat_id: cat.id)

    visit toys_path

    expect(page).to have_content("Fluffy")
    expect(page).to have_content("Squiggles")

    click_on "Squiggles"
    expect(page).to have_content("This toy belongs to...")
    expect(page).to have_content("Fluffy")
  end

  scenario "Create new toy" do

    cat = Cat.create!(name: "Fluffy")
    toy = Toy.create!(name: "Squiggles", cat_id: cat.id)
    visit new_toy_path
    select("Fluffy", from: "toy_cat_id")
    fill_in "Name", with: "Chicken-feet"
    click_on "Create Toy"
    click_on "Chicken-feet"
    expect(page).to have_content("This toy belongs to...")
  end


end
