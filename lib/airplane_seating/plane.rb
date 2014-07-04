require 'airplane_seating/bucket'

module AirplaneSeating
  class Plane

    attr_accessor :buckets

    def initialize(plane_seats)
      @buckets = plane_seats.map do |bucket|
        Bucket.new(bucket[1], bucket[0])
      end
    end

    def passengers

    end
  end
end