class JsonWebToken
  SECRET_KEY = "f3b3927a63234e93235cebe0502c0d861c090758096d29fbe72ce430d87012fb8b1a4334704c34e807426f2dca51c6799c5f383db23fbc01d66033aa66762296"

  def self.encode(payload, exp = Rails.application.config.jwt_exp_time)
    payload[:exp] = exp.to_i
    payload[:random] = rand.to_s[2..5]
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
