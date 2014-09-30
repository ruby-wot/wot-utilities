require 'spinny/utilities/version'

module Spinny
  module Utilities
    def self.caller_binding
      RubyVM::DebugInspector.open {|i| i.frame_binding(3) }
    end
  end
end