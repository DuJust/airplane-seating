require 'spec_helper'
require 'airplane_seating/plane'

module AirplaneSeating
  describe Plane do

    let(:plane) { Plane.new([[3, 2], [4, 3], [2, 3], [3, 4]]) }

    describe '#initialize' do
      it 'should set priorities for all seats' do
        expect(plane.seat(0, 0).priority).to eq(Seat::WINDOW)
        expect(plane.seat(0, 1).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(0, 2).priority).to eq(Seat::AISLE)
        expect(plane.seat(0, 3).priority).to eq(Seat::AISLE)
        expect(plane.seat(0, 4).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(0, 5).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(0, 6).priority).to eq(Seat::AISLE)
        expect(plane.seat(0, 7).priority).to eq(Seat::AISLE)
        expect(plane.seat(0, 8).priority).to eq(Seat::AISLE)
        expect(plane.seat(0, 9).priority).to eq(Seat::AISLE)
        expect(plane.seat(0, 10).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(0, 11).priority).to eq(Seat::WINDOW)

        expect(plane.seat(1, 0).priority).to eq(Seat::WINDOW)
        expect(plane.seat(1, 1).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(1, 2).priority).to eq(Seat::AISLE)
        expect(plane.seat(1, 3).priority).to eq(Seat::AISLE)
        expect(plane.seat(1, 4).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(1, 5).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(1, 6).priority).to eq(Seat::AISLE)
        expect(plane.seat(1, 7).priority).to eq(Seat::AISLE)
        expect(plane.seat(1, 8).priority).to eq(Seat::AISLE)
        expect(plane.seat(1, 9).priority).to eq(Seat::AISLE)
        expect(plane.seat(1, 10).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(1, 11).priority).to eq(Seat::WINDOW)

        expect(plane.seat(2, 3).priority).to eq(Seat::AISLE)
        expect(plane.seat(2, 4).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(2, 5).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(2, 6).priority).to eq(Seat::AISLE)
        expect(plane.seat(2, 7).priority).to eq(Seat::AISLE)
        expect(plane.seat(2, 8).priority).to eq(Seat::AISLE)
        expect(plane.seat(2, 9).priority).to eq(Seat::AISLE)
        expect(plane.seat(2, 10).priority).to eq(Seat::MIDDLE)
        expect(plane.seat(2, 11).priority).to eq(Seat::WINDOW)
      end
    end

    describe '#priority_queue' do
      subject(:priority_queue) { plane.priority_queue }

      it 'should set priority queue' do
        expect(subject[0]).to be(plane.seat(0, 2))
        expect(subject[1]).to be(plane.seat(0, 3))
        expect(subject[2]).to be(plane.seat(0, 6))
        expect(subject[3]).to be(plane.seat(0, 7))
        expect(subject[4]).to be(plane.seat(0, 8))
        expect(subject[5]).to be(plane.seat(0, 9))
        expect(subject[6]).to be(plane.seat(1, 2))
        expect(subject[7]).to be(plane.seat(1, 3))
        expect(subject[8]).to be(plane.seat(1, 6))
        expect(subject[9]).to be(plane.seat(1, 7))
        expect(subject[10]).to be(plane.seat(1, 8))
        expect(subject[11]).to be(plane.seat(1, 9))
        expect(subject[12]).to be(plane.seat(2, 3))
        expect(subject[13]).to be(plane.seat(2, 6))
        expect(subject[14]).to be(plane.seat(2, 7))
        expect(subject[15]).to be(plane.seat(2, 8))
        expect(subject[16]).to be(plane.seat(2, 9))
        expect(subject[17]).to be(plane.seat(3, 9))
        expect(subject[18]).to be(plane.seat(0, 0))
      end
    end

    describe '#passengers' do
      subject {
        plane.passengers(30)
        plane
      }

      it 'should set all passengers to seats' do
        expect(subject.seat(0, 0).passenger).to eq(19)
        expect(subject.seat(0, 1).passenger).to eq(25)
        expect(subject.seat(0, 2).passenger).to eq(1)
        expect(subject.seat(0, 3).passenger).to eq(2)
        expect(subject.seat(0, 4).passenger).to eq(26)
        expect(subject.seat(0, 5).passenger).to eq(27)
        expect(subject.seat(0, 6).passenger).to eq(3)
        expect(subject.seat(0, 7).passenger).to eq(4)
        expect(subject.seat(0, 8).passenger).to eq(5)
        expect(subject.seat(0, 9).passenger).to eq(6)
        expect(subject.seat(0, 10).passenger).to eq(28)
        expect(subject.seat(0, 11).passenger).to eq(20)
      end

    end

    describe 'function test' do
      subject {
        plane.passengers(30)
        plane.to_s
      }
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
