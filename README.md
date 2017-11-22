# DentallyApi

Welcome to the Dentally API Gem. It's purpose is to proved a wrapper and
example to help development of services based around [Dentally](https://dentally.co/) _The UK's leading cloud dental software_.

You can find out more about the API itself [here](https://developer.dentally.co/)

Note: This project comes about from a Dentally developer _scratching
their own itch_. It isn't officially supported by Dentally and the
company will not take support calls about it. Please contact the
developer directly, but also please remember they have a full time job
developing Dentally itself and may not be able to get back to you right
away.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dentally_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dentally_api

## Usage

To use the wrapper you must first get an access token from the Dentally
App itself. You can set this up from the Developer tab in Settings.
If you implement the full OAuth stack then you can get it by
passing through to the Dentally app and getting one back that meets your
needs in a callback to your app. Alternatively you can get a key without
OAuth. Note that the keys will stop working if they aren't used for more
than 2 weeks and you will have to get a new one.

The keys are also tied to access rights. For example, if you only ask for patient
details in read mode, you will not be able to access anything else and
you won't be able to update patient details.

Be very careful with these keys. Storing them openly could
compromise your security. The keys used in this repository are all from
a development system kept from the public internet. Internally we use
environment variables that are not visible anywhere other than the
machines they are deployed on.

### Connecting to Dentally

```ruby

  API_PARAMS =
    {
      host: "https://api.sandbox.dental.ly",
      access_token: "<ACCESS TOKEN>"
  }.freeze

  DentallyApi.new(API_PARAMS)

  practice = client.practice

  puts practice.practice_name # My Practice
```

Note that the params can just be passed as normal, they don't have to be
in a hash, as per the Ruby 2.x conventions.

The details of the fields delivered by the API match the JSON
descriptions in the main documentation. The object returned are Structs
that have the fields in them. As appropriate they may be in arrays.

Struct has also been extended to give a `to_hash` method to make it easy
to generate insert statements that `ActiveRecord` can process easily for
creating rows in your own tables.

The API currently only does Practice information. It will be extended as
needed by the project it was built for, which will probably cover most
of the API in the end. As always, you are welcome to create a pull
request for the bits you needed before we got around to it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fjfish/dentally_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DentallyApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fjfish/dentally_api/blob/master/CODE_OF_CONDUCT.md).
