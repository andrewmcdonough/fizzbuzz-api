ENV['RACK_ENV'] = 'test'

require_relative '../fizzbuzz'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

describe 'The Fizzbuzz App' do
  include Rack::Test::Methods


  def app
    Fizzbuzz
  end

  before do
    allow(ENV).to receive(:fetch).with("FIZZBUZZ_API_KEY").and_return "mysecret"
  end

  context "with correct api key" do
    it "responds with a number for numbers that aren't divisible by 3 or 5" do
      get '/fizzbuzz/1', {},  { 'API_KEY' => 'mysecret' }
      expect(last_response).to be_ok
      expect(last_response.body).to eq("1")
    end

    it "responds with fizz for 3" do
      get '/fizzbuzz/3', {},  { 'API_KEY' => 'mysecret' }
      expect(last_response).to be_ok
      expect(last_response.body).to eq("fizz")
    end
  end

  context "with incorrect api key" do
    it "responds with a number for numbers that aren't divisible by 3 or 5" do
      get '/fizzbuzz/1', {},  { 'API_KEY' => 'failedhack' }
      expect(last_response).to_not be_ok
    end
  end
end
