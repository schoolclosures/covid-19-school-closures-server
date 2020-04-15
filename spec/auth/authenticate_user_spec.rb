require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }
  subject(:valid_auth_obj) { described_class.new( user.email, user.password ) }
  subject(:invalid_auth_obj) { described_class.new( user.email, "MasterYoda" ) }

  describe '/auth/login' do
    context 'with valid credentials' do
      let(:response) { valid_auth_obj.call }

      it 'should authenticate a user and return an auth token' do
        expect(response[:auth_token]).not_to be_empty
      end
      
      it 'should return a user object' do
        expect(response[:user]).not_to be_empty
      end
    end

    context 'with invalid credentials' do
     it 'should raise an authentication error' do
      expect {invalid_auth_obj.call}
        .to raise_error(
          ExceptionHandler::AuthenticationError, /Invalid Credentials/
        )
     end
    end
  end
end