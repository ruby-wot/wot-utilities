require 'wot/utilities/version'
require 'debug_inspector'

module Wot
  module Utilities
    def self.caller_binding(offset=0)
      RubyVM::DebugInspector.open {|i| i.frame_binding(3 + offset) }
    end

    def self.caller_method(method=nil, offset=1)
      method =
        if method.nil?
          '__method__'
        else
          method.inspect
        end

      Wot::Utilities.caller_binding(offset).eval("method(#{method})")
    end
  end
end
