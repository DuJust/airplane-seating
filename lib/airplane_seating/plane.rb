require 'airplane_seating/bucket'

module AirplaneSeating
  class Plane

    attr_accessor :buckets

    def initialize(plane_seats)
      @buckets = plane_seats.map { |bucket| Bucket.new(bucket[1], bucket[0]) }
    end

    def passengers
      @buckets.first.set_left_window_priority
      @buckets.first.set_right_window_priority
    end
  end
end