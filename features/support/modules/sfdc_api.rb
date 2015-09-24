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

def create_contact_via_api(client_name)
  api_client do
    @contact_id = @api_client.create!('Contact', LastName: client_name)
  end
end

def create_opportunity_via_api(client_name, stage_name, close_date, amount)
  api_client do
    @opportunity_id = @api_client.create!('Opportunity',
                                          Name: client_name,
                                          StageName: stage_name,
                                          CloseDate: close_date,
                                          Amount: amount.to_i)
  end
end

def delete_account_via_api
  api_client do
    @api_client.destroy('Account', @account_id)
  end
end

def delete_contact_via_api
  api_client do
    @api_client.destroy('Contact', @contact_id)
  end
end

def delete_opportunity_via_api
  api_client do
    @api_client.destroy('Opportunity', @opportunity_id)
  end
end
end