# encoding: utf-8

module Dioxide
  class Tracker
    def initialize
      # …
    end

    def announce request
      respond do |response|
        response.warn 'dioxide is still under development'
      end
    end

  private
    def respond
      Response.new.tap do |response|
        yield response
      end
    end
  end
end
