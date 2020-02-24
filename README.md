# CtCalendarFor

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ct_calendar_for`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ct_calendar_for'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ct_calendar_for

## Setup

### Popover

To enable the build-in popover functionality remember to add popper, bootstrap (and optionally turbolinks) to your JavaScript. And trigger the popovers like so.

```
document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="popover"]').popover()
  })
  ```

## Usage

### Overview

Call the gem from the view, and use the calendary_type parameter to choose the layout, and use the options to provide feedback to each calendary type.

```
  <%= calendar_for :horizontal, options: {users: users} %>
  <%= calendar_for :annual, options: {year: 2019} %>
```

### Horizontal calendar (timeline)

- TODO

### Annual calendar

- TODO

## Development

- TODO: the gem is not yet available publicly

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CodiTramuntana/ct_calendar_for. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CtCalendarFor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/CodiTramuntana/ct_calendar_for/blob/master/CODE_OF_CONDUCT.md).
