# Cronies

Simple gem to prevent cron-ing your ruby script multiple times by using simple file based locking.


## Installation

Add this line to your application's Gemfile:

    gem 'cronies'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cronies

## Usage

1. Initialize object with script name

	cronies = Cronies::Base.new(\__FILE__)
	
2. Call lock _before_ your script code
	
	cronies.lock
	
3. Call unlock _after_ your script code

	cronies.unlock



# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
