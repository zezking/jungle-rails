require 'rails_helper'
RSpec.describe Product, type: :model do

    describe 'Validations' do

    
      
      it "should be valid with valid attributes" do
       @product=Product.new(
                name:"test-product",
                price:"0",
                quantity:"1",
                category:Category.new
            )
       expect(@product).to be_valid
      end         
      it "should not be valid without a name" do
        @product=Product.new(
            name:nil,
            price:"0",
            quantity:"1",
            category:Category.new
        )
        expect(@product).to_not be_valid
      end         
      it "should not be valid without a price" do
        @product=Product.new(
            name:"test-product",
            price:nil,
            quantity:"1",
            category:Category.new
        )
        expect(@product).to_not be_valid   
      end  
      it "should not be valid without a quantity" do
        @product=Product.new(
            name:"test-product",
            price:"0",
            quantity:nil,
            category:Category.new
        )
   expect(@product).to_not be_valid
      end        
      it "should not be valid without category" do
        @product=Product.new(
            name:"test-product",
            price:"0",
            quantity:"1",
            category:nil
        )
   expect(@product).to_not be_valid
      end    
    end
  end