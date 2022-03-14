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

    context 'add user with empty password' do
      it 'will return error about password' do
        @user.password = nil
        @user.save

        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    end

    context 'add user with empty password confirmation' do
      it 'will return error about password' do
        @user.password_confirmation = nil
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end

    context 'add user with incorrect password confirmation' do
      it 'will return error about password' do
        @user.password_confirmation = 'incorrect-confirmation'
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'add user without email' do
      it 'will return error about no email' do
        @user.email = nil
        @user.save

        expect(@user.errors.full_messages).to include("Email can't be blank")
      end 
    end

    context 'add user with non-unique email - case-insensitive' do
      it 'return error about email being taken' do
        @user2 = User.new
        @user2.name = 'User Two'
        @user2.email = @user.email.upcase
        @user2.password = 'password2'
        @user2.password_confirmation = 'password2'
        
        @user.save
        @user2.save

        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
    end

  end
end
