require 'rails_helper'

feature 'Cats have toys' do

  scenario 'users can view cats' do
    cat = Cat.create!(name: "Fluffy")
    toy = Toy.create!(name: "Squiggles", cat_id: cat.id)

    
  end

end
