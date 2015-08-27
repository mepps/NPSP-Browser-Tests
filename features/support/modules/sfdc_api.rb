module Sfdc_api
def api_client
  @api_client ||= Restforce.new :api_version => '32.0',
                                :refresh_token => ENV['SF_REFRESH_TOKEN'],
                                :client_id => ENV['SF_CLIENT_KEY'],
                                :client_secret => ENV['SF_CLIENT_SECRET']
  yield
end

def create_account_via_api(client_name)
  api_client do
    @account_id = @api_client.create!('Account', Name: client_name)
  end
end

def delete_account_via_api
  api_client do
    @api_client.destroy('Account', @account_id)
  end
end
end