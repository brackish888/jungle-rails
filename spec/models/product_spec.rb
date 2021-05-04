require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

   it 'must have valid attributes' do
      @category = Category.new
      params = {
      name: 'productName',
      description: 'This is a product',
      quantity: 5,
      category: @category,
      price_cents: 1000
      }
      expect(Product.new(params)).to be_valid
    end

    it "must have a name" do
      @category = Category.new
      params = {
      description: 'This is a product',
      quantity: 2,
      category: @category,
      price_cents: 1000

      }
      expect(Product.new(params)).to_not be_valid
    end

    it "must have a price" do
      @category = Category.new
      params = {
      name: 'productName',
      description: 'This is a product',
      quantity: 2,
      category: @category
      }
      expect(Product.new(params)).to_not be_valid
    end

    it "must have a quantity" do
      @category = Category.new
      params = {
      name: 'productName',
      description: 'This is a product',
      category: @category,
      price_cents: 1500
      }
      expect(Product.new(params)).to_not be_valid
    end

    it "must have a category" do
      @category = Category.new
      params = {
      name: 'productName',
      description: 'This is a product',
      quantity: 2,
      price_cents: 1500
      }
      expect(Product.new(params)).to_not be_valid
    end
  end
end