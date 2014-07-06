require 'airplane_seating/util/matrix'
require 'airplane_seating/bucket'

module AirplaneSeating
  class Plane

    def initialize(plane_seats)
      @seats = create_buckets(plane_seats).reduce(Util::Matrix.new(0, 0)) do |meta, bucket|
        meta + bucket.seats
      end
    end

    def create_buckets(plane_seats)
      buckets = plane_seats.map { |bucket| Bucket.new(bucket[1], bucket[0]) }
      buckets.first.set_left_window_priority
      buckets.last.set_right_window_priority
      buckets
    end

    def passengers(persons)
      seat_queue = merge_queues

      persons.times do |person|
        seat = seat_queue.pop
        seat.set_passager(person)
      end

      print_seats
    end

    def seat(row, col)
      @seats[row, col]
    end

  end
end
