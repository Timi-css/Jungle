require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new
    end

    # these tests for the Product model could be improved by using the .errors.full_messages array 
    it "should verify the product is saved" do
      product = Product.new(:name => 'test', :price => 100, :quantity => 100, :category => @category)
      # expect(product.save).to be true
      expect(product).to be_valid
    end
    it "should validate the name of the product" do
      product = Product.new(:name => nil, :price => 100, :quantity => 100, :category => @category)
      puts(product.errors.full_messages)
      expect(product).not_to be_valid
    end
    it "should validate the quantity of the product" do
      product = Product.new(:name => 'test', :price => 100, :category => @category)
      puts(product.errors.full_messages)
      expect(product).not_to be_valid
    end
    it "should validate the price of the product" do
      product = Product.new(:name => 'test', :quantity => 100, :category => @category)
      puts(product.errors.full_messages)
      expect(product).not_to be_valid
    end
    it "should validate the category of the product" do
      product = Product.new(:name => 'test', :price => 100, :quantity => 100)
      puts(product.errors.full_messages)
      expect(product).not_to be_valid
    end
  end
end