require 'spec_helper'
require 'airplane_seating/seat'

describe AirplaneSeating::Seat do

  describe '#initialize' do
    subject { AirplaneSeating::Seat.new }
    its(:capable) { should be_truthy }
  end

  describe '#create_empty' do
    subject { AirplaneSeating::Seat.create_empty }
    its(:capable) { should be_falsey }
  end

  describe '#to_s' do
    subject {
      airplane_seating_seat = AirplaneSeating::Seat.new
      airplane_seating_seat.passenger = 1
      airplane_seating_seat
    }
    its(:to_s) { should eq('1') }
  end
end
