ENV['RACK_ENV'] = 'test'

require_relative '../fizzbuzz'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

describe 'The Fizzbuzz App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "responds with a number for most " do
    get '/fizzbuzz/1'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("1")
  end
end
