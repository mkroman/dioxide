# encoding: utf-8

module Dioxide
  class Tracker
    def initialize
      # …
    end

    def announce request
      respond do
        
      end
    end

  private
    def respond &block
      Response.new.tap do |response|
        body = response.instance_eval &block
        response.body = body unless response.body
      end
    end
  end
end
