module ExceptionHandler
  extend ActiveSupport::Concern 
  
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :four_zero_four
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :four_zero_one
  end

  def four_twenty_two(e)
    json_response({message: e.nessage}, :unprocessable_entity)
  end

  def four_zero_one(e)
    json_response({message: e.message}, :unauthorized)
  end

  def four_zero_four(e)
    json_response({message: e.message}, :not_found)
  end
end