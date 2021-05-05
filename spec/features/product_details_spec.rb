require 'rails_helper'

RSpec.feature "Visitor navigates to Product details", type: :feature, js: true do

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

  scenario "They see all products" do
    # ACT
    visit root_path
    first('.product > header').click

    # #VISIT
    # puts page.html
  

    # DEBUG
    save_screenshot 'product_details_page.png'

    # VERIFY
    expect(page).to be_present
    expect(page).to have_css '.product-detail'
  end
end