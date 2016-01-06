require File.expand_path '../../../spec_helper.rb', __FILE__

describe LettersOnlyFilter do

  let(:input) { [ 'My', 'cat', 'is', 'grey.', 'It', "doesn't", 'have', 'feathers' ] }
  specify do
    expect(LettersOnlyFilter.filter(input)).to eq [
      'My',
      'cat',
      'is',
      'grey',
      'It',
      'doesnt',
      'have',
      'feathers'
    ]
  end

end

