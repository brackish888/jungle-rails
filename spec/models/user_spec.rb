require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'must have valid attributes' do
       params = {
       name: 'userName',
       email: 'example@gmail.com',
       password:'helloWorld',
       password_confirmation:'helloWorld'
       }
       expect(User.new(params)).to be_valid

     end
    it 'must have a password greater than 4 characters' do
       params = {
       name: 'userName',
       email: 'example@gmail.com',
       password: 'hell0',
       password_confirmation:'hell0'
       }
       expect(User.new(params)).to be_valid
     end
    it 'must have matching password/confirmation fields' do
       params = {
       name: 'userName',
       email: 'example@gmail.com',
       password:'hell0',
       password_confirmation:'hello'
       }
       expect(User.new(params)).to_not be_valid
     end

    end 

  describe '.authenticate_with_credentials' do
    
    it "checks the login and returns the authenticated user" do
      user = User.create(name: "Blu Brackish", :email => "brackishblu@gmail.com", :password => "H3ll0", :password_confirmation => "H3ll0")
        authenticated_user = User.authenticate_with_credentials("brackishblu@gmail.com", "H3ll0")
          expect(authenticated_user).to eq(user)
        end
      end
    end