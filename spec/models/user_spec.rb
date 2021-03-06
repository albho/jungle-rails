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
      it 'will return error about empty password' do
        @user.password = nil
        @user.save

        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    end

    context 'add user with empty password confirmation' do
      it 'will return error about empty password confirmation' do
        @user.password_confirmation = nil
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end

    context 'add user with incorrect password confirmation' do
      it 'will return error about incorrect password confirmation' do
        @user.password_confirmation = 'incorrect-confirmation'
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'add user with incorrect password length' do
      it 'will return error about incorrect password length' do
        @user.password = '123'
        @user.password_confirmation = '123'
        @user.save

        expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
      end
    end

    context 'add user without email' do
      it 'will return error about empty email' do
        @user.email = nil
        @user.save

        expect(@user.errors.full_messages).to include("Email can't be blank")
      end 
    end

    context 'add user with non-unique email - case-insensitive' do
      it 'will return error about email being taken' do
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

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user.save
    end

    context 'log in user with correct credentials' do
      it 'should return user object' do
        user = User.authenticate_with_credentials @user.email, @user.password

        expect(user).to be_instance_of(User)
      end
    end

    context 'log in user with incorrect credentials' do
      it 'should not return user object' do
        user = User.authenticate_with_credentials @user.email, 'incorrect-password'

        expect(user).to eq(nil)
      end
    end

    context 'log in user with email with whitespace' do
      it 'should return user object' do
        email_with_whitespace = ' ' + @user.email + ' '
        user = User.authenticate_with_credentials email_with_whitespace, @user.password

        expect(user).to be_instance_of(User)
      end
    end

    context 'log in user with email with incorrect casing' do
      it 'should return user object' do 
        user = User.authenticate_with_credentials @user.email.upcase, @user.password

        expect(user).to be_instance_of(User)
      end
    end

    context 'log in user with email with incorrect email' do
      it 'should not return user object' do 
        incorrect_email = '1' + @user.email
        user = User.authenticate_with_credentials incorrect_email, @user.password

        expect(user).to eq(nil)
      end
    end

    context 'log in user with email with incorrect password' do
      it 'should not return user object' do 
        user = User.authenticate_with_credentials @user.email, @user.password.upcase

        expect(user).to eq(nil)
      end
    end

  end
end
