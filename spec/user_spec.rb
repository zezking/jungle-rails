require 'rails_helper'
RSpec.describe User, type: :model do

    describe 'validations' do
  
        it "should have password and password_conformation field" do
            @user = User.create(
                first_name:"Sori", 
                last_name:"Han",
                email:"example1@gmail.com",
                password:"12345", 
                password_confirmation:"12345")
            expect(@user).to be_valid
        end
        it "should throw error when password and confirmations are not present" do
            @user = User.create(
                first_name:"Sori", 
                last_name:"Han", 
                email:"example@gmail.com",
                password:nil, 
                password_confirmation:nil)
            expect(@user).to_not be_valid
        end
        it "should throw error when password and confirmations are not Equal" do
            @user = User.create(
                first_name:"Sori", 
                last_name:"Han", 
                password:"123", 
                email:"example@gmail.com",
                password_confirmation:"321")
            expect(@user).to_not be_valid
        end
        it "Emails muts be unique and there should not be duplicates emails" do
            @user1 = User.create(
                first_name:"Sori", 
                last_name:"Han", 
                email:"example@gmail.com",
                password:"12345", 
                password_confirmation:"12345")
            @user2 = User.create(
                first_name:"Sori", 
                last_name:"Han", 
                email:"EXAMPLE@gmail.com",
                password:"12345", 
                password_confirmation:"12345")
            expect(@user2).to_not be_valid
        end
        it "throw an error if the password is too short" do
            @user= User.create(
                first_name:"Sori", 
                last_name:"Han", 
                email:"example@gmail.com",
                password:"123", 
                password_confirmation:"123")
            expect(@user).to_not be_valid
        end


    end

    describe '.authenticate_with_credentials' do
        it "should be valid it it passes authentication" do
        @user= User.create(
            first_name:"Sori", 
            last_name:"Han", 
            email:"test2@gmail.com",
            password:"12345", 
            password_confirmation:"12345")
        user = User.authenticate_with_credentials("test2@gmail.com","12345")
        expect(user).to_not be_nil
      end
        it "should return user as nil if the password is incorrect" do
        @user= User.create(
            first_name:"Sori", 
            last_name:"Han", 
            email:"test2@gmail.com",
            password:"12345", 
            password_confirmation:"12345")
        user = User.authenticate_with_credentials("test2@gmail.com","123")
        expect(user).to be_nil
      end
        it "should return user as nil if the email is incorrect " do
        @user= User.create(
            first_name:"Sori", 
            last_name:"Han", 
            email:"test2@gmail.com",
            password:"12345", 
            password_confirmation:"12345")
        user = User.authenticate_with_credentials("TEST@gmail.com","12345")
        expect(user).to be_nil
      end
        it "should return user if the email has empty spaces in it" do
        @user= User.create(
            first_name:"Sori", 
            last_name:"Han", 
            email:"test2@gmail.com",
            password:"12345", 
            password_confirmation:"12345")
        user = User.authenticate_with_credentials("test2@gmail.com","12345")
        expect(user).to_not be_nil
      end
        it "should return user if the email has the wrong cases but the right email typed in" do
        @user= User.create(
            first_name:"Sori", 
            last_name:"Han", 
            email:"test2@gmail.com",
            password:"12345", 
            password_confirmation:"12345")
        user = User.authenticate_with_credentials("TEST2@gmail.com","12345")
        expect(user).to_not be_nil
      end
    end
  end