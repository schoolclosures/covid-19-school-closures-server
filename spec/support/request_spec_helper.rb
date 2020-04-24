module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    exp = Time.now - 20
    JsonWebToken.encode({user_id: user_id}, exp)
  end
end