# NPSP-Browser-Tests
Cross-browser UI tests for NPSP features

How to run browser tests locally (non-Windows OS)
Use this on a test salesforce instance or sandbox!!

* Install Firefox if it’s not already installed

* If you're new to ruby:
* Install RVM and Ruby 2.2
`\curl -sSL https://get.rvm.io | bash -s stable` (for details see https://rvm.io/)
`rvm install ruby 2.2`
** check your install:
	
`which ruby`
*/Users/[your user]/.rvm/rubies/ruby-2.2.1/bin/ruby*
(if you see something like /usr/bin/ruby instead of .rvm/rubies, read the RVM docs and fix your path)

`gem install bundler`
* clone or download the browser test source code
`git clone https://github.com/SalesforceFoundation/NPSP-Browser-Tests.git`
`cd NPSP-Browser-Tests`
`bundle install`

* Follow the directions at https://cumulusci-oauth-tool.herokuapp.com/ and follow the directions to get refresh token, consumer key, and consumer secret

* set the environment variables: 
````
export SF_SERVERURL=https://login.salesforce.com/

export SF_REFRESH_TOKEN=[your refresh token]

export SF_USERNAME=[your username]

export SF_PASSWORD=[your password]

export SF_CLIENT_KEY=[your consumer key]

export SF_CLIENT_SECRET=[your consumer secret]

export RUN_LOCAL=true
````

optional: `export KEEP_BROWSER_OPEN=true` then `unset KEEP_BROWSER_OPEN` to turn it off

run the tests:

`bundle exec cucumber features/`

If you want to use Chrome:

Download the Chrome driver at https://sites.google.com/a/chromium.org/chromedriver/

`sudo mv ~/Downloads/chromedriver /usr/local/bin`

`export SELENIUM_BROWSER=chrome`


This test framework depends heavily on Jeff Morgan's page_object Ruby gem. Please find many details documented at https://github.com/cheezy/page-object/
