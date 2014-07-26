require 'spec_helper'
require 'airplane_seating/seat'

module AirplaneSeating
  describe Seat do
    describe '#to_s' do
      subject {
        airplane_seating_seat = Seat.new
        airplane_seating_seat.passenger = 1
        airplane_seating_seat
      }
      its(:to_s) { should eq('1') }
    end
  end
end
