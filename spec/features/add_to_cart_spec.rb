require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      1.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  

  scenario "Clicking on the product adds it to the cart by increments of 1" do
    # ACT
    visit root_path
    

    # DEBUG
    
    click_on("Add", match: :first)
    sleep 1
    
    # VERIFY
    expect(page).to have_text 'My Cart (1)'
    
    save_screenshot 'cart_test.png'

  end

end

