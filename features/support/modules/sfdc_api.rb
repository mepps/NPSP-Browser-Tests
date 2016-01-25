module Sfdc_api
  def api_client
    @api_client ||= Restforce.new :api_version => '32.0',
                                  :refresh_token => ENV['SF_REFRESH_TOKEN'],
                                  :client_id => ENV['SF_CLIENT_KEY'],
                                  :client_secret => ENV['SF_CLIENT_SECRET']
    yield
  end

  def create(type, obj_hash)
    if is_valid_obj_hash?(type, obj_hash)
      objId = api_client do
        @api_client.create! type, obj_hash
      end
    end
    objId
  end

  def get_object_describe(object_name)
    api_client do
      @description = @api_client.get("/services/data/v35.0/sobjects/#{object_name}/describe")

      describeobject = Hashie::Mash.new(@description.body)

      required = describeobject.fields.map do |x|
        Hashie::Mash.new(
            :fieldName => x.name,
            :required => (!x.nillable && !x.defaultedOnCreate),
            :default => x.defaultValue)
      end
      required.select{|y| y.required}

    end
  end

end