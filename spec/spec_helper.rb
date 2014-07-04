require 'rspec/core'
require 'rspec/its'

require_relative '../lib/airplane_seating_algorithm'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
