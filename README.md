# RspecTree

This is tree command for rspec test files.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rspec_tree

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rspec_tree

## Usage

```
$ rspec_tree all /path/to/your_spec.rb
desc: Sample
desc: First describe
├─────ctx: First context
├───────it: should do something
├───────ctx: First nested context
├─────────it: should do something
├───────it_behaves_like: shared example
desc: Second describe
├─────ctx: Second context
├───────it: should do something else
```

```
$ rspec_tree ctx /path/to/your_spec.rb
desc: Sample
desc: First describe
├─────ctx: First context
├───────ctx: First nested context
desc: Second describe
├─────ctx: Second context
```

```
$ rspec_tree help
Commands:
  rspec_tree all [file]      # Print all (describe, context, it, etc.)
  rspec_tree ctx [file]      # Print only describe and context
  rspec_tree help [COMMAND]  # Describe available commands or one specific command
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sasamuku/rspec_tree. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rspec_tree/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RspecTree project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rspec_tree/blob/master/CODE_OF_CONDUCT.md).
