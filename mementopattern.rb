class Originator
  attr_accessor :color
  def initialize(color)
    @color = color
  end
  def get_state
    Memento.new(@color)
  end
  def restore_state(memento)
    @color = memento.state
  end
end

class Memento
  attr_reader :state
  def initialize(state)
    @state = state
  end
end
class CareTaker
  def self.demo
    state_database = []
    originator = Originator.new("RED")
    puts originator.color
    state_database.push(originator.get_state)

    originator = Originator.new("GREEN")
    puts originator.color
    state_database.push(originator.get_state)

    originator = Originator.new("BLUE")
    puts originator.color
    state_database.push(originator.get_state)

    originator.restore_state(state_database.pop)
    puts originator.color

    originator.restore_state(state_database.pop)
    puts originator.color

    originator.restore_state(state_database.pop)
    puts originator.color
  end
end

CareTaker.demo

