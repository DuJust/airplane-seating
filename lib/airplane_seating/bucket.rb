require 'airplane_seating/util/matrix'
require 'airplane_seating/seat'

module AirplaneSeating
  class Bucket

    LEFT = 0
    RIGHT = -1

    attr_accessor :seats

    def initialize(options = {})
      @seats = Util::Matrix.new(row_size: options[:row], col_size: options[:col]) { Seat.new }
      set_default_priorities
    end

    def +(other)
      @seats = @seats + other.seats
      self
    end

    def seat(row, col)
      @seats[row, col]
    end

    def set_window_priority_by_column(column)
      @seats.column(column).each { |seat| seat.priority = Seat::WINDOW unless seat.nil? }
    end

    private

    def set_default_priorities
      @seats.each { |seat| seat.priority = Seat::MIDDLE }
      @seats.column(LEFT).each { |seat| seat.priority = Seat::AISLE }
      @seats.column(RIGHT).each { |seat| seat.priority = Seat::AISLE }
    end

  end
end
