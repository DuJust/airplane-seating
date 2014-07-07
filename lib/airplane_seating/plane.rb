require 'airplane_seating/util/matrix'
require 'airplane_seating/bucket'

module AirplaneSeating
  class Plane

    def initialize(plane_seats)
      @seats = create_buckets(plane_seats).reduce(Bucket.new(0, 0)) do |meta, bucket|
        meta + bucket
      end.seats
    end

    def create_buckets(plane_seats)
      buckets = plane_seats.map { |bucket| Bucket.new(bucket[1], bucket[0]) }
      buckets.first.set_left_window_priority
      buckets.last.set_right_window_priority
      buckets
    end

    def passengers(persons)
      seat_queue = priority_queue
      persons.times { |person| seat_queue.shift.passenger = person + 1 }
    end

    def priority_queue
      priority_queue = {}
      @seats.each do |seat|
        priority_queue[seat.priority] ||= Array.new
        priority_queue[seat.priority].push seat unless seat.nil?
      end
      priority_queue[Seat::AISLE] + priority_queue[Seat::WINDOW] + priority_queue[Seat::MIDDLE]
    end

    def seat(row, col)
      @seats[row, col]
    end

    def to_s
      @seats.to_s
    end
  end
end
