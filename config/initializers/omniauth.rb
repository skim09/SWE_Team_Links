OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1041961356511-263ps1h30tekas77603bgu3pqir96fgr.apps.googleusercontent.com', 'ip3yrAi1aWzULAHhuFukyqiP', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end