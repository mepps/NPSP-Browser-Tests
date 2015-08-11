require 'rspec'
require 'page-object'
require 'watir-webdriver'
require 'restforce'
# need to require_relative below
require_relative 'modules/sfdc_api'
include Sfdc_api

World(PageObject::PageFactory)

Before do
  if ENV['BROWSER'] and !ENV['RUN_ON_SAUCE']
    @browser = Watir::Browser.new :"#{ENV['BROWSER']}"
  else
    @browser = Watir::Browser.new :firefox
  end

  if ENV['RUN_ON_SAUCE']
    caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['BROWSER'])
    caps.platform = ENV['CAPS_PLATFORM']
    caps.version = ENV['CAPS_BROWSER']
    Watir::Browser.new(
        :remote,
        :url => "http://#{ENV['SAUCE_NAME']}:#{ENV['SAUCE_KEY']}@ondemand.saucelabs.com:80/wd/hub",
        :desired_capabilities => caps)
  end


  unless( ENV['SF_USERNAME'] and ENV['SF_PASSWORD'] and ENV['SF_SERVERURL'])
     puts 'You must have environment variables set for SF_USERNAME and SF_PASSWORD and SF_SERVERURL in order to run these tests'
     abort
  end
end

Before do |scenario|
  @random_string = Random.new.rand(100000000000000000000).to_s
end

After do
  unless ENV['KEEP_BROWSER_OPEN'] == 'true'
    @browser.close
  end
end
