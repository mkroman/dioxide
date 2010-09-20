# encoding: utf-8

require 'rack'
require 'rack/builder'

module Dioxide
  class Server
    attr_accessor :host, :port

    DefaultHost = '0.0.0.0'
    DefaultPort = 3000

    class << self
      def start *args
        new(*args).tap do |server|
          yield server if block_given?
        end.start
      end
    end

    def initialize host = DefaultHost, port = DefaultPort
      @host, @port = host, port
    end

    def start
      puts "==> Starting Dioxide ..."
      puts "!!> Entering empty run loop ..."
      loop do; end
    end

  end
end
