require 'restforce'
require_relative "../api_module"

class NPSPApiPage
  include APIClient
  include PageObject


  def create_account_via_api(client_name)
    create_api_client
    @api_client_id = @api_client.create!('Account', Name: client_name)
  end

  def delete_account_via_api
    create_api_client
    @api_client.destroy('Account', @api_client_id)
  end
end
