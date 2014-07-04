require 'matrix'

module AirplaneSeating
  class Bucket

    attr_accessor :seats

    def initialize(row, col)
      @seats = Matrix.build(row, col) { Seat.new }
    end

  end
end