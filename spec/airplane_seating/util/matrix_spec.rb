require 'spec_helper'
require 'airplane_seating/util/matrix'

describe AirplaneSeating::Util::Matrix do

  subject(:matrix) { AirplaneSeating::Util::Matrix.new(2, 3) { 1 } }

  describe '#initialize' do
    it 'should init matrix' do
      expect(subject[0, 0]).to eq(1)
      expect(subject[0, 1]).to eq(1)
      expect(subject[0, 2]).to eq(1)
      expect(subject[1, 0]).to eq(1)
      expect(subject[1, 1]).to eq(1)
      expect(subject[1, 2]).to eq(1)
    end
  end

  describe '#[]' do
    it 'returns nil if the index (or starting index) are out of range.' do
      expect(matrix[100, 100]).to be_nil
    end
  end

  describe '#+' do
    let(:other) { AirplaneSeating::Util::Matrix.new(3, 2) { 2 } }
    subject { matrix + other }

    it 'should retain origin matrix' do
      expect(subject[0, 0]).to eq(1)
      expect(subject[0, 1]).to eq(1)
      expect(subject[0, 2]).to eq(1)
      expect(subject[1, 0]).to eq(1)
      expect(subject[1, 1]).to eq(1)
      expect(subject[1, 2]).to eq(1)
    end

    it 'should add other matrix inside' do
      expect(subject[0, 3]).to eq(2)
      expect(subject[0, 4]).to eq(2)
      expect(subject[1, 3]).to eq(2)
      expect(subject[1, 4]).to eq(2)
      expect(subject[2, 3]).to eq(2)
      expect(subject[2, 4]).to eq(2)
    end
  end

  describe '#map!' do
    subject do
      matrix.map! { |element| element = 0 }
      matrix
    end

    it 'should map matrix' do
      expect(subject[0, 0]).to eq(0)
      expect(subject[0, 1]).to eq(0)
      expect(subject[0, 2]).to eq(0)
      expect(subject[1, 0]).to eq(0)
      expect(subject[1, 1]).to eq(0)
      expect(subject[1, 2]).to eq(0)
    end
  end

  describe '#column' do
    let(:matrix) { AirplaneSeating::Util::Matrix.new(2, 3) { rand } }
    subject { matrix.column(0) }

    it 'should get column values' do
      expect(subject[0]).to eq(matrix[0, 0])
      expect(subject[1]).to eq(matrix[1, 0])
    end
  end
end
