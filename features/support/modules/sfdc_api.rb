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

def create_relationship_via_api(contact, related_contact)
  api_client do
    @relationshiop_id = @api_client.create!('npe4__Relationship__c', npe4__Contact__c: contact, npe4__RelatedContact__c: related_contact)
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

def delete_contacts_via_api
  api_client do
    @array_of_contacts.each do |contact_id|
      @api_client.destroy('Contact', contact_id)
      end
  end
end

def delete_opportunity_via_api
  api_client do
    @api_client.destroy('Opportunity', @opportunity_id)
  end
end

def delete_open_opportunities
  api_client do
    rd_opps = @api_client.query("select Id from Opportunity where IsClosed = false")
    rd_opps.each do |opp|
      opp.destroy
    end
  end
end

end