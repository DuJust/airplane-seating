require 'matrix'
require 'airplane_seating/seat'

module AirplaneSeating
  class Bucket

    def initialize(row, col)
      @seats = Matrix.build(row, col) { Seat.new }
      set_default_priorities
    end

    def seat(row, col)
      @seats[row, col]
    end

    private

    def set_default_priorities
      @seats.each { |seat| seat.priority = Seat::MIDDLE }
      @seats.column(0).each { |seat| seat.priority = Seat::AISLE }
      @seats.column(-1).each { |seat| seat.priority = Seat::AISLE }
    end

  end
end