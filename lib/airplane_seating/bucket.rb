require 'matrix'
require 'airplane_seating/seat'

module AirplaneSeating
  class Bucket

    LEFT = 0
    RIGHT = -1

    def initialize(row, col)
      @seats = Matrix.build(row, col) { Seat.new }
      set_default_priorities
    end

    def seat(row, col)
      @seats[row, col]
    end

    def set_left_window_priority
      @seats.column(LEFT).each { |seat| seat.priority = Seat::WINDOW }
    end


    def set_right_window_priority
      @seats.column(RIGHT).each { |seat| seat.priority = Seat::WINDOW }
    end

    private

    def set_default_priorities
      @seats.each { |seat| seat.priority = Seat::MIDDLE }
      @seats.column(LEFT).each { |seat| seat.priority = Seat::AISLE }
      @seats.column(RIGHT).each { |seat| seat.priority = Seat::AISLE }
    end

  end
end