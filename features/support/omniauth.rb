 
OmniAuth.config.test_mode = true  

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
OmniAuth.config.mock_auth[:google_oauth2] = {
   :provider => 'google_oauth2',
   :user_id => '1234567',
   :info => {
     :nickname => 'test',
     :email => 'info@wesleyan.edu',
     :name => 'Test User',
     :authenticated => true
    }.stringify_keys!
  }.stringify_keys!
