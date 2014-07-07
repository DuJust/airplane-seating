require 'matrix'

module AirplaneSeating
  class Seat

    attr_accessor :priority, :capable, :passenger

    AISLE = 3
    WINDOW = 2
    MIDDLE = 1

    DEFAULT_CAPABLE = true

    def initialize(options = {})
      @capable = options[:capable].nil? ? DEFAULT_CAPABLE : options[:capable]
    end

    def self.create_empty
      new(capable: false)
    end

    def to_s
      passenger.to_s
    end

  end
end
