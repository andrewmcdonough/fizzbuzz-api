require 'sinatra'
require 'pry'
require_relative './lib/fizzbuzz_resolver'


class Fizzbuzz < Sinatra::Base
  get '/fizzbuzz/:number' do
    if ENV['FIZZBUZZ_SERVICE_ENABLED'] == "true"
      number = params[:number]
      FizzbuzzResolver.new.resolve(number.to_i).to_s
    else
      "The Fizzbuzz service isn't currently available"
    end
  end
end
