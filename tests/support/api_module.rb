module APIClient
  def create_api_client
    @api_client = Restforce.new :api_version => '32.0',
                                :refresh_token => ENV['SF_REFRESH_TOKEN'],
                                :client_id => ENV['SF_CLIENT_KEY'],
                                :client_secret => ENV['SF_CLIENT_SECRET']
  end
end