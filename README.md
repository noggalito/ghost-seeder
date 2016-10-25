# Ghost::Seeder

Seed your ghost website with initial data in a scalable way.

[Why do we want to seed ghost? (blog post)](http://macool.me/seeding-ghost/24)

[![Gem Version](https://badge.fury.io/rb/ghost-seeder.svg)](https://badge.fury.io/rb/ghost-seeder)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ghost-seeder'
```

And then execute:

    $ bundle

## Usage

1. Add your **DB adapter** to your own Gemfile

  example: https://github.com/prendho/webpage/blob/master/Gemfile#L5-L11

  (at the moment we're using SQLite for dev environments and PostgreSQL for production environments)

2. Add some **seed data** (simple YML files)

  example: https://github.com/prendho/webpage/tree/master/config/seed/fixtures

  These files will be parsed and DB records will be created for the models specified in the files

3. Require (and run) our **rake tasks**

  example: https://github.com/prendho/webpage/blob/master/Rakefile

    $ rake db:seed

  and use `WIPE_DB` env variable within the task if you want to first wipe the tables. Useful when the seeds are modified and you want to recreate everything from scratch - will also help you detect inconsistences

    $ rake db:seed WIPE_DB=true

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noggalito/ghost-seeder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
