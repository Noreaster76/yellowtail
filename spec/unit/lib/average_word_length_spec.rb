require_relative '../../../spec/spec_helper.rb'

describe AverageWordLength do

  describe '.calculate' do

    context 'when the input is nil' do
      let(:input) { nil }
      specify { expect(described_class.calculate(input)).to eq 0 }
    end

    context 'when the input is non-nil' do

      context 'but it is otherwise empty' do
        let(:input) { '' }
        specify { expect(described_class.calculate(input)).to eq 0 }
      end
      context 'and it is non-empty' do
        context 'and it contains just a single word' do
          let(:input) { 'a' }
          specify { expect(described_class.calculate(input)).to eq 1 }
        end
        context 'and it contains multiple words' do
          let(:input) { 'a fluffy bunny' }
          specify { expect(described_class.calculate(input)).to eq 4 }
        end
      end
    end

  end

end
