require 'airplane_seating/util/matrix'
require 'airplane_seating/bucket'

module AirplaneSeating
  class Plane

    def initialize(plane_seats)
      @seats = create_seats(plane_seats)
    end

    def create_seats(plane_seat_sizes)
      bucket = plane_seat_sizes.inject(Bucket.new(row: 0, col: 0)) do |meta, plane_seat_size|
        meta + Bucket.new(row: plane_seat_size[1], col: plane_seat_size[0])
      end
      bucket.set_window_priority_by_column(Bucket::LEFT)
      bucket.set_window_priority_by_column(Bucket::RIGHT)
      bucket.seats
    end

    def passengers(persons)
      passengers_queue = priority_queue
      persons.times { |person| passengers_queue.shift.passenger = person + 1 }
    end

    def priority_queue
      priority_queue_hash = {}
      @seats.each do |seat|
        priority_queue_hash[seat.priority] ||= Array.new
        priority_queue_hash[seat.priority].push seat unless seat.nil?
      end
      priority_queue_hash[Seat::AISLE] + priority_queue_hash[Seat::WINDOW] + priority_queue_hash[Seat::MIDDLE]
    end

    def seat(row, col)
      @seats[row, col]
    end

    def to_s
      @seats.to_s
    end
  end
end
