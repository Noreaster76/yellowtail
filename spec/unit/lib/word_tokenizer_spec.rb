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
          context 'but the word contains a number' do
            let(:input) { 'a2' }
            specify { expect(described_class.tokenize(input)).to eq [ ] }
          end
          context 'but the word contains a punctuation symbol' do
            context 'and the punctuation symbol is not an apostrophe' do
              let(:input) { 'done.' }
              specify { expect(described_class.tokenize(input)).to eq [ 'done' ] }
            end
            context 'and the punctuation symbol is an apostrophe' do
              let(:input) { "I'm" }
              specify { expect(described_class.tokenize(input)).to eq [ "I'm" ] }
            end
          end
          context 'and the word does not contain any numbers' do
            let(:input) { 'a' }
            specify { expect(described_class.tokenize(input)).to eq [ 'a' ] }
          end
        end
        context 'and it contains multiple words' do
          let(:input) { " a\r\nfluffy\t bunny" }
          specify { expect(described_class.tokenize(input)).to eq [ 'a', 'fluffy', 'bunny' ] }
        end
      end
    end

  end

end
