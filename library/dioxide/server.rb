# encoding: utf-8

module Dioxide
  class Server
    attr_accessor :host, :port

    DefaultHost = '0.0.0.0'
    DefaultPort = 6969

    class << self
      def start *args
        new(*args).tap do |server|
          yield server if block_given?
        end.start
      end
    end

    def initialize host = DefaultHost, port = DefaultPort
      @host, @port = host, port
      @tracker = Tracker.new
    end

    def start
      app = Rack::Builder.new do
        use Rack::CommonLogger
        use Rack::ShowStatus
        use Rack::ShowExceptions
      end

      Rack::Handler::Thin.run @tracker, Host: @host, Port: @port do |server|
        # …
      end
    end

  end
end
