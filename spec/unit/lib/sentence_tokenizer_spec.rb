require_relative '../../../spec/spec_helper.rb'

describe SentenceTokenizer do

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
        context 'and it contains just a single sentence' do
          let(:input) { ' I see the moon. ' }
          specify { expect(described_class.tokenize(input)).to eq [ 'I see the moon' ] }
        end
        context 'and it contains multiple sentences' do
          let(:input) { " henry? a\r\nfluffy\t bunny ran to 7-Eleven. i saw it myself. i swear! i kid you not." }
          specify { expect(described_class.tokenize(input)).to eq [
            'henry',
            "a\r\nfluffy\t bunny ran to 7-Eleven",
            'i saw it myself',
            'i swear',
            'i kid you not'
          ] }
        end
      end
    end

  end

end
