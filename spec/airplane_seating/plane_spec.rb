require 'spec_helper'
require 'airplane_seating/plane'

describe AirplaneSeating::Plane do

  let(:plane) { AirplaneSeating::Plane.new([[3, 2], [4, 3], [2, 3], [3, 4]]) }

  describe '#initialize' do
    it 'should set priorities for all seats' do
      expect(plane.seat(0, 0).priority).to eq(AirplaneSeating::Seat::WINDOW)
      expect(plane.seat(0, 1).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(plane.seat(0, 2).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(plane.seat(0, 3).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(plane.seat(0, 4).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(plane.seat(0, 5).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(plane.seat(0, 6).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(plane.seat(0, 7).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(plane.seat(0, 8).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(plane.seat(0, 9).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(plane.seat(0, 10).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(plane.seat(0, 11).priority).to eq(AirplaneSeating::Seat::WINDOW)
    end
  end

  describe '#passengers' do
    pending 'functional test' do
      subject { plane.passengers(30) }
      it { should eq(<<-EOS
19 25  1  2 26 27  3  4  5  6 28 20
21 29  7  8 30     9 10 11 12    22
         13       14 15 16 17    23
                           18    24
                  EOS
                  ) }
    end
  end

end
