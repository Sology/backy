# Backy

Simple and sweet database backup.

## Installation

Add this line to your application's Gemfile:

    gem 'backy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install test

## Usage

Simply run
	
	$ rake backy:dump

to dump your database into db/backy.sql file.

To retrieve database from the file run

	$ rake backy:load

## Contributing

1. Fork it ( http://github.com/<my-github-username>/test/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
