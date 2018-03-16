OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1087279364639-037mlijelnjun8516qon2gnqvah9l5fb.apps.googleusercontent.com', 'm3Cu4mpXsPiyXOx5VV8C6dK_', {skip_jwt: true}
end
