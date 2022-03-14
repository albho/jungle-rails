require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new
    @user.name = 'firstname lastname'
    @user.email = 'test@test.com'
    @user.password = 'test-password'
    @user.password_confirmation = 'test-password'
  end

  describe 'Validations' do

    context 'add user without name' do
      it 'will return error about no name' do
        @user.name = nil
        @user.save

        expect(@user.errors.full_messages).to include("Name can't be blank")
      end 
    end

    context 'add user with correct password and confirmation' do
      it 'will save successfully' do
        @user.save

        expect(@user).to be_present
      end
    end

    context 'add user with incorrect password confirmation' do
      it 'will return error about password' do
        @user.password_confirmation = 'incorrect-confirmation'
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'add user with empty password confirmation' do
      it 'will return error about password' do
        @user.password_confirmation = nil
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end

  end
end
