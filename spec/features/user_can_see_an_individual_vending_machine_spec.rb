require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see all the snacks in the vending machine and their prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create!(name: "White Castle Burger", price: "3.50")
    snack2 = dons.snacks.create!(name: "Pop Rocks", price: "1.50")
    snack3 = dons.snacks.create!(name: "Flaming Hot Cheetos", price: "2.50")

    visit machine_path(dons)

    expect(page).to have_content("White Castle Burger")
    expect(page).to have_content("Price: $3.50")
    expect(page).to have_content("Pop Rocks")
    expect(page).to have_content("Price: $1.50")
    expect(page).to have_content("Average price: $2.50")
  end
end
