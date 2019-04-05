require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  scenario 'they see the price for that snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create!(name: "White Castle Burger", price: "3.50")
    snack2 = dons.snacks.create!(name: "Pop Rocks", price: "1.50")
    snack3 = dons.snacks.create!(name: "Flaming Hot Cheetos", price: "2.50")

    visit snack_path(snack1)

    expect(page).to have_content("Name: #{snack1.name}")
    expect(page).to have_content("Price: $#{snack1.price}0")
    expect(page).to have_content("Locations: Don's Mixed Drinks")
    expect(page).to have_content("3 kinds of snacks, average price of $2.50")
  end
end
