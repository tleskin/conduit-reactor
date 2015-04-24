# Conduit::Reactor

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'conduit-reactor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conduit-reactor

## Steps to add an action

1. Create a file in `lib/conduit/reactor/actions` with a name matching the action
  * This code actually sends the request to the external service
  * It should derive from `Conduit::Driver::Reactor::Base`

2. Create a parser for the action in `lib/conduit/reactor/parsers`
  * This code will interpret results of the call to the action and normalize the data

3. Create a decorator for the action in `lib/conduit/reactor/decorators`
  * The class will be used to build up the request body being sent to the external service
  * This gets used from the `Conduit::Driver::Reactor::Base`

4. Create a view for the action request in `lib/conduit/reactor/views`
  * The view is what actually gets rendered as the request. It typically uses the
  attributes and values built up the the decorator to make the request

5. Implement `lib/conduit/reactor/request_mocker/<action>.rb`
  * Typically this can just inherit from the `RequestMocker::Base`

6. Implement success and failure responses in `lib/conduit/reactor/request_mocker/fixtures/<action>`
  * Mocked responses can be used when testing projects using this conduit implementation
  without the need to actually call the external service

7. Add an action line in `lib/conduit/reactor/driver.rb` matching the action you've just added

8. Test that crap out of it. You'll sleep better if you do.

## Usage

TODO: Write usage instructions here
