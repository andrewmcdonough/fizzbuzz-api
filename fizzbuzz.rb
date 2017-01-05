require 'sinatra'
require 'pry'
require_relative './lib/fizzbuzz_resolver'
require 'redis'
require 'json'

class Fizzbuzz < Sinatra::Base
  get '/fizzbuzz/:number' do
    if ENV.fetch('FIZZBUZZ_API_KEY') == request.env["API_KEY"]
      number = params[:number]
      FizzbuzzResolver.new.resolve(number.to_i).to_s
    else
      halt 403
    end
  end

  get '/redis-status' do
    vcap_services_config = JSON.parse(ENV['VCAP_SERVICES'])

    host = vcap_services_config["rediscloud"].first["credentials"]["hostname"]
    port = vcap_services_config["rediscloud"].first["credentials"]["port"]
    password = vcap_services_config["rediscloud"].first["credentials"]["password"]

    redis = Redis.new(host: host, port: port, password: password)
    if redis.ping == "PONG"
      "OKAY"
    else
      "FAIL"
    end
  end

  get '/external-redis-status' do
    vcap_services_config = JSON.parse(ENV['VCAP_SERVICES'])

    host = vcap_services_config["user-provided"].first["credentials"]["hostname"]
    port = vcap_services_config["user-provided"].first["credentials"]["port"]
    password = vcap_services_config["user-provided"].first["credentials"]["password"]

    redis = Redis.new(host: host, port: port, password: password)
    if redis.ping == "PONG"
      "OKAY"
    else
      "FAIL"
    end
  end

end
