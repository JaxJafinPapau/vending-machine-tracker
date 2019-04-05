require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should belong_to :machine }
  end

  describe 'instance methods' do
    it 'pricify' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = dons.snacks.create!(name: "White Castle Burger", price: "3.50")
      snack2 = dons.snacks.create!(name: "Pop Rocks", price: "1.50")
      snack3 = dons.snacks.create!(name: "Flaming Hot Cheetos", price: "2.50")

      expect(snack1.pricify(snack1.price)).to eq("3.50")
    end
  end

  describe 'class methods' do
    it ".average_price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = dons.snacks.create!(name: "White Castle Burger", price: "3.50")
      snack2 = dons.snacks.create!(name: "Pop Rocks", price: "1.50")
      snack3 = dons.snacks.create!(name: "Flaming Hot Cheetos", price: "2.50")

      expect(dons.snacks.average_price).to eq("2.50")
    end

    it ".locations" do
    end
  end
end
