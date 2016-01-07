# LegacyUUID

Converts UIDs to predictable UUIDs.

## Installation

Add this line to your application's Gemfile:

    gem 'legacy_uuid', github: "everydayhero/legacy_uuid"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install legacy_uuid

## Usage

```ruby
LegacyUUID.from_campaign("au-123") # => "eda1e64c-0001-4000-8000-00000000007b"
LegacyUUID.from_charity("au-123")  # => "edb1e64c-0001-4000-8000-00000000007b"
LegacyUUID.from_page("au-123")  # => "edc1e64c-0001-4000-8000-00000000007b"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/legacy_uuid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
