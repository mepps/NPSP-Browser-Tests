# NPSP-Browser-Tests
Cross-browser UI tests for NPSP features

How to run browser tests locally (non-Windows OS)

* Install Firefox if it’s not already installed
* Install RVM: “$ \curl -sSL https://get.rvm.io | bash -s stable” (for details see https://rvm.io/)
* “$ rvm install ruby 2.2”
** check your install:
	
	$ which ruby
	/Users/cmcmahon/.rvm/rubies/ruby-2.2.1/bin/ruby

	(if you see something like /usr/bin/ruby instead of .rvm/rubies, read the RVM docs and fix your path or whatever it takes)
* “$ gem install bundler”
* clone or download the browser test source code and navigate to 
NPSP-Browser-Tests
* “$ bundle install” 
* run the tests: 

export SF_REFRESH_TOKEN=

export SF_CLIENT_KEY=

export SF_CLIENT_SECRET

(see https://cumulusci-oauth-tool.herokuapp.com/)

export RUN_LOCAL=true

optional: export KEEP_BROWSER_OPEN=true then “unset KEEP_BROWSER_OPEN” to turn it off

“$ bundle exec cucumber features/”

optional: export SELENIUM_DRIVER=chrome
