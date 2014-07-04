require 'spec_helper'
require 'airplane_seating/plane'

describe AirplaneSeating::Plane do

  describe '#passengers' do
    pending 'functional test' do
      subject { AirplaneSeating::Plane.new([[3, 2], [4, 3], [2, 3], [3, 4]]).passengers }
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
