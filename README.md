# grape-cli [![Build Status](https://travis-ci.org/elpassion/grape-cli.svg?branch=master)](https://travis-ci.org/elpassion/grape-cli) [![Code Climate](https://codeclimate.com/github/elpassion/grape-cli/badges/gpa.svg)](https://codeclimate.com/github/elpassion/grape-cli) [![Gem Version](https://badge.fury.io/rb/grape-cli.svg)](http://badge.fury.io/rb/grape-cli)

Grape-CLI is a gem for bootstraping standalone Grape application.
It is heavily inspired by Rails/Ember generators.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-cli

## Usage

###New application
Create new Grape app in current directory with provided application name

    $ grape new application_name

For new command you can provide multiple options:

###Test framework

    $ grape new application_name --test=minitest


will create new application with minitest as test framework,
running new command without specifying `--test` option will setup application with RSpec as it's default one.

###Database

    $ grape new application_name --database=postgres


will create new application with postgres as database,
running new command without specifying `--database` option will setup application with sqlite as it's default one.

###Start application server

    $ cd application_name
    $ grape server
or

    $ grape s
    
This command support all rackup parameters.

Go to http://localhost:9292/

###Start application console

    $ grape console
or

    $ grape c

###Run your application tets

    $ grape test


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elpassion/grape-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](CODE_OF_CONDUCT.md) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

