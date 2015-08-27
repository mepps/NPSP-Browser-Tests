require 'rspec'
require 'page-object'
require 'watir-webdriver'
require 'restforce'
# need to require_relative below
require_relative 'modules/sfdc_api'
include Sfdc_api

World(PageObject::PageFactory)

def test_name(scenario)
  if scenario.respond_to? :feature
    "#{scenario.feature.name}: #{scenario.name}"
  elsif scenario.respond_to? :scenario_outline
    "#{scenario.scenario_outline.feature.name}: #{scenario.scenario_outline.name}: #{scenario.name}"
  end
end

Before do |scenario|
  if ENV['RUN_LOCAL']
    if ENV['SELENIUM_BROWSER']
      @browser = Watir::Browser.new :"#{ENV['SELENIUM_BROWSER']}"
    else
      @browser = Watir::Browser.new :firefox
    end
  end

  sauce_test_name = test_name(scenario)

  if ENV['RUN_ON_SAUCE']
    caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['SELENIUM_BROWSER'])
    caps.platform = ENV['SELENIUM_PLATFORM']
    caps.version = ENV['SELENIUM_VERSION']
    caps[:name] = sauce_test_name

    @browser = Watir::Browser.new(
        :remote,
        :url => "http://#{ENV['SAUCE_NAME']}:#{ENV['SAUCE_KEY']}@ondemand.saucelabs.com:80/wd/hub",
        :desired_capabilities => caps)

    @session_id = @browser.driver.capabilities["webdriver.remote.sessionid"]
    STDOUT.write "SauceOnDemandSessionID=" + @session_id
    end


  unless( ENV['SF_USERNAME'] and ENV['SF_PASSWORD'] and ENV['SF_SERVERURL'])
     puts 'You must have environment variables set for SF_USERNAME and SF_PASSWORD and SF_SERVERURL in order to run these tests'
     abort
  end
end

Before do |scenario|
  @random_string = Random.new.rand(100000000000000000000).to_s
end

After do |scenario|
  if ENV['RUN_ON_SAUCE']
    %x{curl -X PUT -s -d '{"passed": #{scenario.passed?}}' -u #{ENV['SAUCE_NAME']}:#{ENV['SAUCE_KEY']} @saucelabs.com/rest/v1/#{ENV['SAUCE_NAME']}/jobs/#{@session_id}}
  end

  @browser.close unless ENV['KEEP_BROWSER_OPEN']
end
