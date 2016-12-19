require 'sinatra'
require 'pry'
require_relative './lib/fizzbuzz_resolver'

get '/fizzbuzz/:number' do
  number = params[:number]
  FizzbuzzResolver.new.resolve(number.to_i).to_s
end
