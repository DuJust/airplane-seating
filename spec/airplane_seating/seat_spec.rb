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
end
