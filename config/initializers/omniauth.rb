OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '213582692103701', '025b109fd4a5ff149981f792f118dd57'
  # :display => 'popup'
end