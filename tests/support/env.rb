require 'rspec'
require 'page-object'
require 'watir-webdriver'

World(PageObject::PageFactory)

Before do
  if ENV['BROWSER']
    @browser = Watir::Browser.new :"#{ENV['BROWSER']}"
  else
    @browser = Watir::Browser.new :firefox
  end
end

After do
  unless ENV['KEEP_BROWSER_OPEN'] == 'true'
    @browser.close
  end
end
