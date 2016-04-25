OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1041961356511-t8gej6d93m0gl77usen4stfe7vi8vpo1.apps.googleusercontent.com', 'zYP6Oi9m4rimY_5FFPsiGYSY', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end