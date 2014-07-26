require 'matrix'

module AirplaneSeating
  class Seat

    attr_accessor :priority, :passenger

    AISLE = 3
    WINDOW = 2
    MIDDLE = 1

    def to_s
      passenger.to_s
    end

  end
end
