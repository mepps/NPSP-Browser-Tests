class LoginPage
  include PageObject

  page_url 'https://login.salesforce.com/'

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login_button, id: 'Login')

  def login_with_env_vars
    self.username_element.when_present.send_keys(ENV['SF_USERNAME'])
    self.password_element.when_present.send_keys(ENV['SF_PASSWORD'])
    login_button
  end

  def login_with_reduced_privs
    self.username_element.when_present.send_keys(ENV['SF_LOW_PRIVS_USERNAME'])
    self.password_element.when_present.send_keys(ENV['SF_LOW_PRIVS_PASSWORD'])
    login_button
  end

end
