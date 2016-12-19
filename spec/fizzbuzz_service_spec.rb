ENV['RACK_ENV'] = 'test'

require_relative '../fizzbuzz'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

describe 'The Fizzbuzz App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "responds with a number for numbers that aren't divisible by 3 or 5" do
    get '/fizzbuzz/1'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("1")
  end

  it "responds with fizz for 3" do
    get '/fizzbuzz/3'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("fizz")
  end
end
