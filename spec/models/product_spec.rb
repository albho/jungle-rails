require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new
      @product = Product.new
      @product.name = 'test product'
      @product.price_cents = 1;
      @product.quantity = 10;
      @product.category_id = @category.id;
    end

    context 'add product with correct fields' do
      it 'save successfully' do
        @product.save

        expect(@product).to be_present
      end
    end

    context 'add product without name' do
      it 'return error about name' do
        @product.name = nil;
        @product.save

        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'add product without price' do
      it 'return error about price_cents' do
        @product.price_cents = nil;
        @product.save

        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'add product without quantity' do
      it 'return error about quantity' do
        @product.quantity = nil;
        @product.save

        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'add product without category' do
      it 'return error about category' do
        @product.category = nil;
        @product.save

        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
