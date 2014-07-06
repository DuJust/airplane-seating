require 'spec_helper'
require 'airplane_seating/bucket'

describe AirplaneSeating::Bucket do

  subject(:bucket) { AirplaneSeating::Bucket.new(2, 3) }

  describe '#initialize' do
    it 'should set default priorities' do
      expect(subject.seat(0, 0).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(0, 1).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(subject.seat(0, 2).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(1, 0).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(1, 1).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(subject.seat(1, 2).priority).to eq(AirplaneSeating::Seat::AISLE)
    end
  end

  describe '#set_left_window_priority' do
    subject {
      bucket.set_left_window_priority
      bucket
    }
    it 'should set all left side to window priority' do
      expect(subject.seat(0, 0).priority).to eq(AirplaneSeating::Seat::WINDOW)
      expect(subject.seat(1, 0).priority).to eq(AirplaneSeating::Seat::WINDOW)
    end
  end

  describe '#set_right_window_priority' do
    subject {
      bucket.set_right_window_priority
      bucket
    }
    it 'should set all left side to window priority' do
      expect(subject.seat(0, 2).priority).to eq(AirplaneSeating::Seat::WINDOW)
      expect(subject.seat(1, 2).priority).to eq(AirplaneSeating::Seat::WINDOW)
    end
  end

  describe '#+' do
    let(:empty_bucket) { AirplaneSeating::Bucket.new(0, 0) }
    subject { empty_bucket + bucket }

    it 'should merge buckets' do
      expect(subject.seat(0, 0).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(0, 1).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(subject.seat(0, 2).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(1, 0).priority).to eq(AirplaneSeating::Seat::AISLE)
      expect(subject.seat(1, 1).priority).to eq(AirplaneSeating::Seat::MIDDLE)
      expect(subject.seat(1, 2).priority).to eq(AirplaneSeating::Seat::AISLE)
    end
  end
end
