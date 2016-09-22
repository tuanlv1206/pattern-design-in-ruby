class StateTest
  BaseState = Struct.new :owner
  class StateError < Exception; end

  class StateOn < BaseState
    attr_accessor :target
    def connect(target)
      raise StateError, "Already connected"
    end
    def disconnect()
      return StateOff.new(owner), true
    end
    def description()
      [self, "We're connected to #{target}"]
    end
  end

  class StateOff < BaseState
    def connect(target)
      st = StateOn.new(owner)
      st.target=target
      return st, true
    end
    def disconnect()
      raise StateError, "Already disconnected"
    end
    def description() [self, "We're disconnected"] end
  end

  def initialize
    @state = StateOff.new(self)
  end
  def method_missing(m, *a, &b)
    @state, result = @state.send(m, *a, &b)
    result
  end
end

p t = StateTest.new
puts t.description
puts t.connect "foo"
puts t.description
puts t.disconnect
puts t.description
puts t.disconnect
