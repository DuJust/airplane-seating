require 'spec_helper'
require 'airplane_seating/bucket'

module AirplaneSeating
  describe Bucket do

    subject(:bucket) { Bucket.new(row: 2, col: 3) }

    describe '#initialize' do
      it 'should set default priorities' do
        expect(subject.seat(0, 0).priority).to eq(Seat::AISLE)
        expect(subject.seat(0, 1).priority).to eq(Seat::MIDDLE)
        expect(subject.seat(0, 2).priority).to eq(Seat::AISLE)
        expect(subject.seat(1, 0).priority).to eq(Seat::AISLE)
        expect(subject.seat(1, 1).priority).to eq(Seat::MIDDLE)
        expect(subject.seat(1, 2).priority).to eq(Seat::AISLE)
      end
    end

    describe '#set_window_priority_by_column' do
      subject {
        bucket.set_window_priority_by_column(Bucket::LEFT)
        bucket
      }
      it 'should set all left side to window priority' do
        expect(subject.seat(0, 0).priority).to eq(Seat::WINDOW)
        expect(subject.seat(1, 0).priority).to eq(Seat::WINDOW)
      end
    end

    describe '#+' do
      let(:empty_bucket) { Bucket.new(row: 0, col: 0) }
      subject { empty_bucket + bucket }

      it 'should merge buckets' do
        expect(subject.seat(0, 0).priority).to eq(Seat::AISLE)
        expect(subject.seat(0, 1).priority).to eq(Seat::MIDDLE)
        expect(subject.seat(0, 2).priority).to eq(Seat::AISLE)
        expect(subject.seat(1, 0).priority).to eq(Seat::AISLE)
        expect(subject.seat(1, 1).priority).to eq(Seat::MIDDLE)
        expect(subject.seat(1, 2).priority).to eq(Seat::AISLE)
      end
    end
  end
end
