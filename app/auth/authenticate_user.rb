class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    authenticate_user
  end

  private
  
  attr_reader :email, :password

  def authenticate_user
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      auth_token = JsonWebToken.encode(user_id: user.id)
      return HashWithIndifferentAccess.new(user: user.as_json.except(:password_digest), auth_token: auth_token)
    end

    raise ExceptionHandler::AuthenticationError, Message.invalid_credentials
  end

end