require 'rails_helper'
RSpec.describe User, type: :model do

    describe 'validations' do
  
        it "should have password and password_conformation field" do
            @user = User.new(
                first_name:"Sori", 
                last_name:"Han",
                email:"example@gmail.com",
                password:"123", 
                password_confirmation:"123")
            expect(@user).to be_valid
        end
        it "should throw error when password and confirmations are not present" do
            @user = User.new(
                first_name:"Sori", 
                last_name:"Han", 
                email:"example@gmail.com",
                password:nil, 
                password_confirmation:nil)
            expect(@user).to_not be_valid
        end
        it "should throw error when password and confirmations are not Equal" do
            @user = User.new(
                first_name:"Sori", 
                last_name:"Han", 
                password:"123", 
                email:"example@gmail.com",
                password_confirmation:"321")
            expect(@user).to_not be_valid
        end
        it "Emails muts be unique and there should not be duplicates emails" do
            @user1 = User.new(
                first_name:"Sori", 
                last_name:"Han", 
                email:"example@gmail.com",
                password:"123", 
                password_confirmation:"321")
            @user2 = User.new(
                first_name:"Sori", 
                last_name:"Han", 
                email:"EXAMPLE@gmail.com",
                password:"123", 
                password_confirmation:"321")
            expect(@user2).to_not be_valid
        end
    end
  end