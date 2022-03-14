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

  end
end
