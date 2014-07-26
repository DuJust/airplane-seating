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

    def set_priority_by_column(column, priority)
      @seats.column(column).each { |seat| seat.priority = priority unless seat.nil? }
    end

    def seat(row, col)
      @seats[row, col]
    end

    private

    def set_default_priorities
      @seats.each { |seat| seat.priority = Seat::MIDDLE }
      set_priority_by_column(LEFT, Seat::AISLE)
      set_priority_by_column(RIGHT, Seat::AISLE)
    end

  end
end
