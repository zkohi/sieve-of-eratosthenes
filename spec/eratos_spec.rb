require File.expand_path(File.dirname(__FILE__) + '/../eratos')

describe Eratos do
  describe '#search' do

    shared_examples 'not valid' do |end_number|
      specify { expect(described_class.search(end_number)).to eq '探索範囲の末尾を2以上の整数で指定してください' }
    end

    shared_examples 'Sieve of Eratosthenes' do |end_number, expected|
      specify { expect(described_class.search(end_number)).to eq expected }
    end

    context 'when ARGV is 0' do
      it_should_behave_like 'not valid', ['0']
    end

    context 'when ARGV is a1' do
      it_should_behave_like 'not valid', ['a1']
    end

    context 'when ARGV is 1' do
      it_should_behave_like 'not valid', ['1']
    end

    context 'when ARGV is 1' do
      it_should_behave_like 'not valid', ['2', '3']
    end

    context 'when ARGV is 2' do
      it_should_behave_like 'Sieve of Eratosthenes', ['2'], [2]
    end

    context 'when ARGV is 3' do
      it_should_behave_like 'Sieve of Eratosthenes', ['3'], [2, 3]
    end

    context 'when ARGV is 5' do
      it_should_behave_like 'Sieve of Eratosthenes', ['5'], [2, 3, 5]
    end

    context 'when ARGV is 120' do
      it_should_behave_like 'Sieve of Eratosthenes', ['120'], [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113]
    end

    context 'when ARGV is 130' do
      it_should_behave_like 'Sieve of Eratosthenes', ['130'], [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127]
    end
  end
end
