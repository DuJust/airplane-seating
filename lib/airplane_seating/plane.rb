require 'airplane_seating/bucket'

module AirplaneSeating
  class Plane

    attr_accessor :seats

    def initialize(plane_seats)
      @buckets = plane_seats.each_with_index.map do |bucket, index|
        Bucket.new(row: bucket[1], col: bucket[0], index: index)
      end
      merge_buckets
    end

    def passengers(persons)
      set_buckets_window_priorities
    end

    def seat(row, col)
      @seats[row, col]
    end

    private

    def max_row
      @buckets.max_by { |bucket| bucket.row }.row
    end

    def columns
      @buckets.reduce(0) { |meta, bucket| meta += bucket.col }
    end

    def set_buckets_window_priorities
      @buckets.first.set_left_window_priority
      @buckets.last.set_right_window_priority
    end
  end
end
