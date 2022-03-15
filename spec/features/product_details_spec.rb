require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(word_count: 3),
        description: Faker::Hipster.paragraph(sentence_count: 4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on a product" do
    visit root_path

    # commented out b/c it's for debugging only
    first('h4').click

    expect(page).to have_css 'article.product-detail', count: 1
    save_and_open_screenshot
  end
end
