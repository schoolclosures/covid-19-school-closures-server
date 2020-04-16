require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization': token_generator(user.id) } }
  subject(:valid_request_object) { described_class.new(header) }
  subject(:invalid_request_object) { described_class.new({}) }

  describe '#call' do
    context 'with valid auth header' do
      it 'should return a user object' do
        result = valid_request_object.call
        expect(result[:user]['email'])
          .to eq(user.email)
      end
    end
  
    context 'invalid auth header' do
      context 'with missing authentication token' do
        it 'should raise a missing token error' do
          expect { invalid_request_object.call }
          .to raise_error(
            ExceptionHandler::MissingToken, /Missing Token/
          )
        end
      end

      context 'with invalid token' do
        subject(:invalid_request_object) { described_class.new( 'Authorization': token_generator(5) ) }
        it 'should raise an invalid token error' do
          expect { invalid_request_object.call }
            .to raise_error(
              ExceptionHandler::InvalidToken, /Invalid Token/
            )
        end
      end

      context 'with expired token' do
        subject(:invalid_request_object) { described_class.new( 'Authorization': expired_token_generator(5) ) }
        it 'should raise an invalid token error' do
          expect { invalid_request_object.call }
            .to raise_error(
              ExceptionHandler::InvalidToken, /Invalid Token/
            )
        end
      end

      context 'with fake token' do
        subject(:invalid_request_object) { described_class.new( 'Authorization': 'Master Yoda' ) }

        it 'should handle JWT Decode Error' do
          expect { invalid_request_object.call }
            .to raise_error(
              ExceptionHandler::InvalidToken, /Invalid Token/
            )
        end
      end
    end 
  
  end

end