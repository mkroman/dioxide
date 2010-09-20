# encoding: utf-8

module Dioxide
  class Response < Rack::Response
    def initialize hash = nil, status = 200
      @status, @body = status, hash

      yield self if block_given?
    end

    def error message
      @body = { failure_reason: message }
    end

    def warn message
      @body = { warning_message: message }
    end

    def finish
      [@status, {}, @body.bencode]
    end
  end
end
