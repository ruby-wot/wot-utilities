require 'spinny/utilities/version'
require 'debug_inspector'

module Spinny
  module Utilities
    def self.caller_binding
      RubyVM::DebugInspector.open {|i| i.frame_binding(3) }
    end

    def self.caller_method
      Spinny::Utilities.caller_binding.eval('method(__method__)')
    end
  end
end
