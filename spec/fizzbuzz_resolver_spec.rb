
require_relative '../lib/fizzbuzz_resolver.rb'

RSpec.describe FizzbuzzResolver do
  subject { described_class.new }

  it 'responds with a number' do
    expect(subject.resolve(1)).to eq 1
  end

  it 'responds with fizz if the number if divisible by 3' do
    expect(subject.resolve(3)).to eq 'fizz'
  end

  context 'numbers divisible by 5' do
    it 'responds with buzz for 5' do
      expect(subject.resolve(5)).to eq 'buzz'
    end

    it 'responds with buzz for 10' do
      expect(subject.resolve(10)).to eq 'buzz'
    end
  end

  context 'numbers divisible by both 3 and 5' do
    it 'response with fizzbuzz for 15' do
      expect(subject.resolve(15)).to eq 'fizzbuzz'
    end
  end
end
