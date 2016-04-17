OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1041961356511-l1buchtlh22qsv9o5k6cg34qt8tbk1o1.apps.googleusercontent.com', '2ewZjRMY4tbqbg8tk9abGbTF', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end