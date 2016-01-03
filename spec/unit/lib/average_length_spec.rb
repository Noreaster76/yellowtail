require_relative '../../../spec/spec_helper.rb'

describe AverageLength do

  describe '.calculate' do

    context 'when the input contains no elements' do
      let(:input) { [] }
      specify { expect(described_class.calculate(input)).to eq 0 }
    end

    context 'when the input contains elements' do

      context 'and it contains just a single element which responds to :length' do
        let(:input) { [ 'a' ] }
        specify { expect(described_class.calculate(input)).to eq 1 }
      end
      context 'and it contains multiple elements, each of which respond to :length' do
        let(:input) { [ 'a', 'fluffy', 'bunny' ] }
        specify { expect(described_class.calculate(input)).to eq 4 }
      end

    end

  end

end
