$:.unshift File.dirname(__FILE__)

require 'reek/name'
require 'reek/method_context'
require 'reek/printer'

module Reek
  class SingletonMethodContext < MethodContext

    def initialize(outer, exp)
      super(outer, exp, false)
      @name = Name.new(exp[2])
      @receiver = Printer.print(exp[1])
      @depends_on_self = true
    end

    def envious_receivers
      []
    end
    
    def outer_name
      "#{@outer.outer_name}#{@receiver}.#{@name}/"
    end

    def to_s
      "#{@outer.outer_name}#{@receiver}.#{@name}"
    end
  end
end