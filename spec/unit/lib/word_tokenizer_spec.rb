require_relative '../../../spec/spec_helper.rb'

describe WordTokenizer do

  describe '.tokenize' do

    context 'when the input is nil' do
      let(:input) { nil }
      specify { expect(described_class.tokenize(input)).to eq [] }
    end

    context 'when the input is non-nil' do

      context 'but it is otherwise empty' do
        let(:input) { '' }
        specify { expect(described_class.tokenize(input)).to eq [] }
      end
      context 'and it is non-empty' do
        context 'and it contains just a single word' do
          let(:input) { 'a' }
          specify { expect(described_class.tokenize(input)).to eq [ 'a' ] }
        end
        context 'and it contains multiple words' do
          let(:input) { " a\r\nfluffy\t bunny" }
          specify { expect(described_class.tokenize(input)).to eq [ 'a', 'fluffy', 'bunny' ] }
        end
      end
    end

  end

end
