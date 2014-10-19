require 'spinny/utilities/version'
require 'debug_inspector'

module Spinny
  module Utilities
    def self.caller_binding(offset=0)
      RubyVM::DebugInspector.open {|i| i.frame_binding(3 + offset) }
    end

    def self.caller_method(method=nil, offset=0)
      method =
        if method.nil?
          '__method__'
        else
          method.inspect
        end

      Spinny::Utilities.caller_binding(1 + offset).eval("method(#{method})")
    end
  end
end
