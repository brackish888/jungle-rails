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
end