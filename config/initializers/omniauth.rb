OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '249003385244541', 'a3090ec3341f6f9213ac93e75e240b85'
  provider :twitter, "zcKN40JFXz5xNqzEfOVA", "pZzazBkewXLhVtpd8n1Efafj3aMAMgKdIVJF250lc"
end