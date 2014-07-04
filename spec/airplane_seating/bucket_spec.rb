require 'spec_helper'
require 'airplane_seating/bucket'

describe AirplaneSeating::Bucket do

  describe '#initialize' do
    subject { AirplaneSeating::Bucket.new(2, 3) }

    it 'should set default priorities' do
      expect(subject.seat(0, 0).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(0, 1).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(subject.seat(0, 2).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(1, 0).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(1, 1).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(subject.seat(1, 2).priority).to eq(AirplaneSeating::Seat::AISLE)
    end
  end

end
