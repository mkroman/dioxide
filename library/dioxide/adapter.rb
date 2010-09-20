# encoding: utf-8

module Dioxide
  class Adapter
    def initialize
      # …
    end

    def call env
      request = Request.new env
       method = File.basename(request.path).gsub /[^a-zA-Z0-9]+/, ''

       if @tracker.respond_to? method
         @tracker.__send__ method, request
       else
         Response.new do |response|
           response.error 'invalid request'
         end.finish
       end
     end
  end
end
