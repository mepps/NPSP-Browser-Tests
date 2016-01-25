module Sfdc_api_npsp
  def is_valid_obj_hash?(object_name, obj_hash)
    required_fields = get_object_describe(object_name).map{|x| x.fieldName}
    #   [name, id, required_field_1__c, etc]
    valid = true
    required_fields.each do |f|

      # NPSP will automatically create certain fields on certain objects based on required input values for those records.
      # There is no way to know in advance from the API which these are, so we find them empirically and handle them.
      fields_acceptibly_nil = {'Contact': ['Name'],
                               'Opportunity': ['ForecastCategory']}

      valid = false if((!obj_hash.has_key? f.to_sym) and (!fields_acceptibly_nil[object_name].contains? f rescue false))
    end
    valid
  end

  def create_account_via_api(client_name)
    @account_id = create 'Account', {Name:client_name}
  end

  def create_contact_via_api(client_name, street = '', city = '',  state = '', country = '', zip = '')
    api_client do
      @contact_id = create 'Contact', {LastName: client_name,
                                       MailingStreet: street,
                                       MailingCity: city,
                                       MailingState: state,
                                       MailingCountry: country,
                                       MailingPostalCode: zip}
      @contact_name = client_name
      account_object = @api_client.query("select AccountId from Contact where Id = '#{@contact_id}'")
      my_account_object = account_object.first
      @account_id_for_contact = my_account_object.AccountId
      @array_of_contacts << @contact_id
    end
  end

def create_two_contacts_on_account_via_api(client_name1, client_name2)
  api_client do
    @contact_id = create 'Contact', {LastName: client_name1}
    @contact_name = client_name1
    @array_of_contact_names << client_name1
    account_object = @api_client.query("select AccountId from Contact where Id = '#{@contact_id}'")
    my_account_object = account_object.first
    @account_id_for_contact = my_account_object.AccountId
    @array_of_contacts << @contact_id
    @contact_id = create 'Contact', {LastName: client_name2, AccountId: @account_id}
    @contact_name = client_name2
    @array_of_contact_names << client_name2
    @array_of_contacts << @contact_id
  end
end

def create_contacts_with_household_object_via_api(hh_obj, contact_name)
  api_client do
    @hh_obj_id = create 'npo02__Household__c', {Name: hh_obj}
    @contact_id = create 'Contact', {LastName: contact_name, npo02__Household__c: @hh_obj_id}
    @array_of_contacts << @contact_id
    @contact_id = create 'Contact', {LastName: contact_name, MailingCity: "hhmailingcity", npo02__Household__c: @hh_obj_id}
    @array_of_contacts << @contact_id
  end
end

def create_gau_via_api(gau_name)
  api_client do
    @gau_id = create 'npsp__General_Accounting_Unit__c', {Name: gau_name}
  end
end

def create_lead_via_api(last_name, company)
  api_client do
    @lead_id = create 'Lead', {LastName: last_name, Company: company}
  end
end

def create_opportunity_via_api(client_name, stage_name, close_date, amount)
  api_client do
    @opportunity_id = create 'Opportunity',
                                          {Name: client_name,
                                          StageName: stage_name,
                                          CloseDate: close_date,
                                          Amount: amount.to_i,
                                          AccountId: @account_id_for_contact}
  end
end

def create_relationship_via_api(contact, related_contact)
  api_client do
    @relationshiop_id =  create 'npe4__Relationship__c', {npe4__Contact__c: contact, npe4__RelatedContact__c: related_contact}
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

def delete_gaus_via_api
  api_client do
    @array_of_gaus.each do |contact_id|
      @api_client.destroy('npsp__General_Accounting_Unit__c', contact_id)
    end
  end
end

def delete_lead_via_api
  api_client do
    @api_client.destroy('Lead', @lead_id)
  end
end

def delete_opportunity_via_api
  api_client do
    @api_client.destroy('Opportunity', @opportunity_id)
  end
end

def delete_household_accounts
  api_client do
    rd_opps = @api_client.query("select Id from Account where Type = 'Household'")
    rd_opps.each do |hh|
      hh.destroy
    end
  end
end

def delete_household_objects
  api_client do
    rd_opps = @api_client.query("select Id from npo02__Household__c")
    rd_opps.each do |hh|
      hh.destroy
    end
  end
end

def delete_leads
  api_client do
    leads = @api_client.query("select Id from Lead")
    leads.each do |lead|
      lead.destroy
    end
  end
end

def delete_payments
  api_client do
    payments = @api_client.query("select Id from npe01__OppPayment__c")
    payments.each do |payment|
      payment.destroy
    end
  end
end

def delete_non_household_accounts
  api_client do
    rd_opps = @api_client.query("select Id from Account where Type = null")
    rd_opps.each do |hh|
      hh.destroy
    end
  end
end

def delete_opportunities
  api_client do
    rd_opps = @api_client.query("select Id from Opportunity")
    rd_opps.each do |opp|
      opp.destroy
    end
  end
end

def delete_recurring_donations
  api_client do
    rds = @api_client.query("select Id from npe03__Recurring_Donation__c")
    rds.each do |rd|
      rd.destroy
    end
  end
end

def update_account_model(to_value)
  api_client do
    acc_id = @api_client.query("select Id from npe01__Contacts_And_Orgs_Settings__c")
    acc = acc_id.first
    @api_client.update('npe01__Contacts_And_Orgs_Settings__c', Id: acc.Id, npe01__Account_Processor__c: to_value )
  end
end

def set_url_namespace_to_npsp
  #THIS IS FOR A MANAGED ORG TEST ENV. UNMANAGED ORG WILL HAVE A DIFFERENT URL SCHEME FOR NPSP PAGES
  interim_url = $instance_url.sub("https://", "https://npsp.")
  $target_org_url = interim_url.sub("salesforce.com", "visual.force.com")
end

def login_with_oauth
  require 'faraday'

  conn = Faraday.new(:url => ENV['SF_SERVERURL']) do |faraday|
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
  $instance_url = response_body['instance_url']

  @browser.goto('about:blank')
  @browser.goto($instance_url + '/secur/frontdoor.jsp?sid=' + access_token)
  @browser.goto($instance_url + '/home/showAllTabs.jsp')
end

end
