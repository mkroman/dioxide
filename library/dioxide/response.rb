# encoding: utf-8

module Dioxide
  class Response < Rack::Response
    def body= body
      body.respond_to? :each ? super(value) : super([value])
    end
  end
end
