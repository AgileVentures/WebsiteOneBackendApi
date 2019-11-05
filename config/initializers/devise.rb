Devise.setup do |config|
  config.jwt do |jwt|
    jwt.secret = ENV['DEVISE_JWT_SECRET_KEY']
  end
end