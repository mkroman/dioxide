# encoding: utf-8

module Dioxide
  class Tracker
    def initialize
      # …
    end

    def call env
      request = Request.new env
       method = File.basename(request.path).gsub /[^a-zA-Z0-9]+/, ''

       if respond_to? method
         __send__ method, request
       else
         Response.new do |response|
           response.error "invalid request"
         end.finish
       end
     end

     def announce request
       Response.new do |request|
         request.warn "tracker not functional"
       end.finish
     end
  end
end
