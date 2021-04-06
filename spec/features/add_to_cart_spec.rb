
require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do
     # SETUP
     before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "Cart gets updated from 0 to 1" do
      visit root_path
      expect(page.has_content?('My Cart (0)')).to be(true)
      find('button.btn-primary', match: :first).click
      save_screenshot
      expect(page.has_content?('My Cart (1)')).to be(true)
    end

