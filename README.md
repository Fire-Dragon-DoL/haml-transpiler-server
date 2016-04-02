# HamlTranspilerServer

Simple HTTP server which allows transpiling HAML files through HTTP request

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'haml-transpiler-server'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install haml-transpiler-server

## Usage

Usage is simple:

    hamlts

It will start an HTTP server on port 5487.

Performing an HTTP POST request to `/content` with `content` param set to a
valid HAML string will return the HTML version of it in the body.

Performing an HTTP POST request to `/path` with `path` param set to a _full_
file path with where the server is hosted will return the HTML version of the
content of the file, if it's valid HAML.

If any error is raised, a generic `500` code is reported, with error message
and backtrace as body.

## Configuration

The gem starts in development/production/test based on `RACK_ENV` environment
variable.

Port can be set to something different by setting the `HAMLTS_PORT` env
variable.

By default, the server binds to `0.0.0.0`, but you can change it by setting
`HAMLTS_BIND` env variable.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/haml-transpiler-server.

