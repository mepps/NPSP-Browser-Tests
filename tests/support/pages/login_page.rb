class LoginPage
  include PageObject

  page_url 'https://login.salesforce.com<%=params[:redirect_to]%>'

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login_button, id: 'Login')

  def login_with_env_vars
    self.username_element.when_present.send_keys(ENV['SF_USERNAME'])
    self.password_element.when_present.send_keys(ENV['SF_PASSWORD'])
    login_button
  end

  def login_with_oauth
    require 'faraday'

    conn = Faraday.new(:url => 'https://login.salesforce.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      #faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end


    response = conn.post '/services/oauth2/token', {
              :grant_type => 'refresh_token',
              :client_id => ENV['SF_CLIENT_KEY'],
              :client_secret => ENV['SF_CLIENT_SECRET'],
              :refresh_token => ENV['SF_REFRESH_TOKEN']
    }

    response_body = JSON.parse(response.body)
    access_token = response_body['access_token']
    instance_url = response_body['instance_url']

    @browser.goto(instance_url + '/secur/frontdoor.jsp?sid=' + access_token)
  end

  def login_with_reduced_privs
    self.username_element.when_present.send_keys(ENV['SF_LOW_PRIVS_USERNAME'])
    self.password_element.when_present.send_keys(ENV['SF_LOW_PRIVS_PASSWORD'])
    login_button
  end

end
