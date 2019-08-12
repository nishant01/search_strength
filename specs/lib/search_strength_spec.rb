require_relative '../../lib/search_strength'

describe SearchStrength do
  describe 'Input File' do
    context 'given input exist' do
      it 'returns input file instance' do
        input = File.read(ARGV[0])
        expect(ARGV.length).to eq(1)
        expect(input.split("\n").length).to_not eq(0)
      end
    end

    context 'given input file have partial or no parameters' do
      it 'throws exception due to missing file or appropriate parameter' do
        expect { SearchStrength.new(input) }.to raise_error(NameError)
      end
    end
  end

  describe 'Validate Input File' do
    context 'Given input file parameter is correct or not' do
      it 'returns input file instance' do
        input = File.read(ARGV[0])
        expect(input).to include("P")
        expect(input).to include("Q")
      end
    end

    context 'given input file have partial or no parameters' do
      it 'throws exception due to missing file or appropriate parameter' do
        expect { SearchStrength.new(input) }.to raise_error(NameError)
      end
    end
  end
end
