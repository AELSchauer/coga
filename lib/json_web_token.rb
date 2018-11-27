class JsonWebToken
  class << self
    def encode(payload, exp=24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.jwt_secret_key)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.jwt_secret_key)[0]
      HashWithIndifferentAccess.new(body).symbolize_keys
    rescue
      nil
    end
  end
end
