Given(/^I create an Engagement Plan Template$/) do
  step 'I navigate to Engagement Plan Template'
  step 'I fill in EPT information'
  step 'I create a Task and a Subtask'
  step 'I save my EPT'
end

Given(/^I create a Levels field on Account$/) do

  @tooling_api_client ||= Restforce.tooling api_version: '32.0',
                                            refresh_token: ENV['SF_REFRESH_TOKEN'],
                                            client_id: ENV['SF_CLIENT_KEY'],
                                            client_secret: ENV['SF_CLIENT_SECRET']

Restforce.log = true

  @tooling_api_client.create!('Account', CustomField: {
      DeveloperName: 'PreviousLevel__c', Metadata: {
       label: "Previous Level",
       name: "PreviousLevel__c",
       referenceTo: ["npsp__Level__c"],
       relationshipName: "PreviousLevel__r",
       type: "reference"
    }
  }
  )

end
