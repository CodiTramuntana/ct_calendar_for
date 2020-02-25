# CtCalendarFor

CodiTramuntana's CalendarFor gem is an html calendar builder, it's main goal is to build simple calendars for your views.

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

- Creates an horizontal calendar, limited to a range of dates.
- It is intended to work with multiple users (or entities which respond to "name").
- There is a built-in search feature to work ransack 'search_form_for' form builder.

#### Options

- users: Collection of users, will add a row for each.
- start_date: Date for the calendar to begin
- end_date: Date for the calendar to end


- search? : Bool, if you want the search field or not
- search_attribute: Name of the attribute to search/filter, uses "contains" ransack filter
- search_placeholder: String to use as search input placeholder
- object: Object to use on the search form
- url: path to perform the search

### Annual calendar (blocks)

- Creates a full year calendar into monthly bloks.
- Uses popover functionality on each day.

#### Options

- year: Year to represent the calendar for.
- start_day: (Symbol) First day of the week (:monday as default)

### Annual calendar (horizontal)

- Creates a full year calendar into monthly rows.
- Uses popover functionality on each day.

#### Options

- year: Year to represent the calendar for.
- start_day: (Symbol) First day of the week (:monday as default)

### Monthly calendar

- Creates a calendar displaying a full month.

#### Options

- month: Month to represent the calendar for.
- start_day: (Symbol) First day of the week (:monday as default)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CodiTramuntana/ct_calendar_for. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CtCalendarFor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/CodiTramuntana/ct_calendar_for/blob/master/CODE_OF_CONDUCT.md).
